import 'package:flutter/material.dart';

import 'json_load.dart';
import 'image_load.dart';
import 'font-load.dart';

void main() => runApp(MyApp());

/*
一个应用程序少不了一些静态资源，例如：图片、字体、配置文件等。
这些静态资源会打包到程序安装包中，可以在运行时访问。

asset 的声明顺序是无关紧要的。
在构建期间，Flutter 将 asset 放置到称为 asset bundle 的特殊存档中，应用程序可以在运行时通过 AssetBundle 对象访问。
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地数据读取'),
      ),
      // body: JSONLoadView(),
      body: Column(
        children: <Widget>[
          ImageLoadView(),
          FontsLoadView()
          
        ],
      ),
    );
  }
}
