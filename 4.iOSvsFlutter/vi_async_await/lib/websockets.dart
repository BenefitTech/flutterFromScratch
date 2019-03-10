/*
除了正常的HTTP请求外，我们还可以使用WebSocket连接到服务器。WebSocket允许与服务器进行双向通信而无需轮询。

在这个例子中，我们将连接到由websocket.org提供的测试服务器。服务器将简单地返回我们发送给它的相同消息！

步骤
  连接到WebSocket服务器。
  监听来自服务器的消息。
  将数据发送到服务器。
  关闭WebSocket连接。



1. 连接到WebSocket服务器
web_socket_channel package 提供了我们需要连接到WebSocket服务器的工具.

该package提供了一个WebSocketChannel允许我们既可以监听来自服务器的消息，又可以将消息发送到服务器的方法。

在Flutter中，我们可以创建一个WebSocketChannel连接到一台服务器：
 */

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

/*
2. 监听来自服务器的消息
现在我们建立了连接，我们可以监听来自服务器的消息，在我们发送消息给测试服务器之后，它会返回相同的消息。

我们如何收取消息并显示它们？在这个例子中，我们将使用一个StreamBuilder Widget来监听新消息， 并用一个Text Widget来显示它们。
 */

// StreamBuilder(
//   stream:widget.channel.stream,
//   builder:(context,snapshot){
//     return Text(snapshot.hasData ? '$(snapshot.data)':'');
//   }
// );

/*
这是如何工作的?
WebSocketChannel提供了一个来自服务器的消息Stream 。

该Stream类是dart:async包中的一个基础类。它提供了一种方法来监听来自数据源的异步事件。与Future返回单个异步响应不同，Stream类可以随着时间推移传递很多事件。

该StreamBuilder Widget将连接到一个Stream， 并在每次收到消息时通知Flutter重新构建界面。
*/

/*
3. 将数据发送到服务器
为了将数据发送到服务器，我们会add消息给WebSocketChannel提供的sink。
*/
// channel.sink.add('hello!');
/*
这是如何工作的？
WebSocketChannel提供了一个StreamSink，它将消息发给服务器。
StreamSink类提供了给数据源同步或异步添加事件的一般方法。
*/

/*
4. 关闭WebSocket连接
在我们使用WebSocket后，要关闭连接：
*/
// channel.sink.close();

class SocketPage extends StatefulWidget {
  final String title = 'Websocket demo';
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ""),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
