import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;

/*
1. 
http.get方法返回一个包含一个Response的Future。
  Future是与异步操作一起工作的核心Dart类。它用于表示未来某个时间可能会出现的可用值或错误。
  http.Response类包含一个成功的HTTP请求接收到的数据
*/
Future<http.Response> fetchPost() {
  return http.get('https://jsonplaceholder.typicode.com/posts/1');
}

/*
2. 将响应转换为自定义Dart对象
虽然发出网络请求很简单，但如果要使用原始的Future<http.Response>并不简单。为了让我们可以开开心心的写代码，我们可以将http.Response转换成我们自己的Dart对象。

创建一个Post类
首先，我们需要创建一个Post类，它包含我们网络请求的数据。它还将包括一个工厂构造函数，它允许我们可以通过json创建一个Post对象。

手动转换JSON只是一种选择。有关更多信息，请参阅关于JSON和序列化的完整文章。
 */

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

/*
3.将http.Response 转换成一个Post对象
现在，我们将更新fetchPost函数以返回一个Future<Post>。为此，我们需要：

  1.使用dart:convert package将响应内容转化为一个json Map。
  2.使用fromJson工厂函数，将json Map 转化为一个Post对象。
 */

Future<Post> fetchPostModel() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final jsonModel = json.decode(response.body);
  return Post.fromJson(jsonModel);
}

/*
4.获取并显示数据
为了获取数据并将其显示在屏幕上，我们可以使用FutureBuilder widget！FutureBuilder Widget可以很容易与异步数据源一起工作。

我们需要提供两个参数：
  4.1 future参数是一个异步的网络请求，在这个例子中，我们传递调用fetchPost()函数的返回值(一个future)。
  4.2 一个 builder 函数，这告诉Flutter在future执行的不同阶段应该如何渲染界面。
 */

getPostWidget() {
  return FutureBuilder<Post>(
    future: fetchPostModel(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(
          snapshot.data.title,
          style: TextStyle(color: Colors.red),
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      // 默认,显示一个loading spinner
      return CircularProgressIndicator();
    },
  );
}

class DataToJSONModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: getPostWidget(),
      ),
    );
  }
}
