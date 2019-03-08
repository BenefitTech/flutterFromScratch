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

final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
