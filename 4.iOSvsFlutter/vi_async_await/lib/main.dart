import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'isolate_async_await.dart';
import 'http_package_json_model_usage.dart';

/**
 * 
 * 首先补充一些语法,关于const final static
"static" 表示成员在类本身上可用，而不是在类的实例上。 这就是它的意思，并没有用于其他地方。 static修饰成员。
"final" 表示单一赋值：final变量或字段必须初始化。 一旦赋值，就不能改变final变量的值。 final修饰变量。
"const" 的含义在Dart中有点复杂和微妙。 const修饰值。 您可以在创建集合时使用它，例如const [1,2,3] ，以及构造对象（代替new），比如const Point（2,3）。这里，const意味着对象的整个深度状态可以在编译时完全确定，并且对象将被冻结并完全不可变。

注意: 
final ==> 变量,但是,一旦确定,不能修改
const ==> 值
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SampleAppPage(),
      // home: IsolateTestPage(),
      home: DataToJSONModelPage(),
    );
  }
}

/*
我怎么编写异步的代码？
Dart 是单线程执行模型，但是它支持 Isolate（一种让 Dart 代码运行在其他线程的方式）、事件循环和异步编程。
除非你自己创建一个 Isolate ，否则你的 Dart 代码永远运行在 UI 线程，并由 event loop 驱动。Flutter 的 event loop 和 iOS 中的 main loop 相似——Looper 是附加在主线程上的。

Dart 的单线程模型并不意味着你写的代码一定是阻塞操作，从而卡住 UI。相反，使用 Dart 语言提供的异步工具，例如 async / await ，来实现异步操作。

举个例子，你可以使用 async / await 来让 Dart 帮你做一些繁重的工作，编写网络请求代码而不会挂起 UI：
 */

class SampleAppPage extends StatefulWidget {
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // 添加loadingView 
  getBody(){
    if (widgets.length == 0) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context,int position){
        return getRow(position);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: getBody(),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Row ${widgets[i]["title"]}'),
    );
  }

  loadData() async {
    /* dart io 库中原生支持写法
    创建 client.
    构造 Uri.
    发起请求, 等待请求，同时您也可以配置请求headers、 body。
    关闭请求, 等待响应.
    解码响应的内容.
     */
    var httpClient = HttpClient();
    var uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    setState(() {
      // 一旦 await 到网络请求完成，通过调用 setState() 来更新 UI，这会触发 widget 子树的重建，并更新相关数据。
      widgets = json.decode(responseBody);
    });
  }
}
