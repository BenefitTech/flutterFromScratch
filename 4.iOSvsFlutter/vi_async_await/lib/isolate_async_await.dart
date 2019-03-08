/*
你是怎么把工作放到后台线程的？
由于 Flutter 是单线程并且跑着一个 event loop 的（就像 Node.js 那样），你不必为线程管理或是开启后台线程而操心。
如果你正在做 I/O 操作，如访问磁盘或网络请求，安全地使用 async / await 就完事了。
如果，在另外的情况下，你需要做让 CPU 执行繁忙的计算密集型任务，你需要使用 Isolate 来避免阻塞 event loop。

对于 I/O 操作，通过关键字 async，把方法声明为异步方法，然后通过await关键字等待该异步方法执行完成(译者语：这和javascript中是相同的)：
 */

/*
然而，有时候你需要处理大量的数据，这会导致你的 UI 挂起。在 Flutter 中，使用 Isolate 来发挥多核心 CPU 的优势来处理那些长期运行或是计算密集型的任务。

Isolates 是分离的运行线程，并且不和主线程的内存堆共享内存。这意味着你不能访问主线程中的变量，或者使用 setState() 来更新 UI。正如它们的名字一样，Isolates 不能共享内存。

下面的例子展示了一个简单的 isolate，是如何把数据返回给主线程来更新 UI 的：
 */
import 'dart:isolate';
import 'dart:convert';
// 三方库支持网络请求
import 'package:http/http.dart' as HTTP;
import 'package:flutter/material.dart';

class IsolateTestPage extends StatefulWidget {
  IsolateTestPage({Key key}) : super(key: key);

  @override
  _IsolateTestPageState createState() => _IsolateTestPageState();
}

class _IsolateTestPageState extends State<IsolateTestPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return _getRow(position);
            }));
  }

  Widget _getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  // 开辟子线程,进行大批量操作
  _loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends its SendPort as the first message
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }

  // isolate 的入口
  static void _dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);
  
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataURL = data;

      HTTP.Response response = await HTTP.get(dataURL);

      // Lots of json to parse
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}
