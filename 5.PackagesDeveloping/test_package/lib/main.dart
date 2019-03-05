import 'package:flutter/material.dart';
import 'package:i_pure_dart_package/i_pure_dart_package.dart';

void main() => runApp(MyApp());
/*
Package 介绍
使用package可以创建可轻松共享的模块化代码。一个最小的package包括

一个pubspec.yaml文件：声明了package的名称、版本、作者等的元数据文件。
一个 lib 文件夹：包括包中公开的(public)代码，最少应有一个<package-name>.dart文件

Package 类型
Packages可以包含多种内容：
  Dart包：其中一些可能包含Flutter的特定功能，因此对Flutter框架具有依赖性，仅将其用于Flutter，例如fluro包。
  插件包：一种专用的Dart包，其中包含用Dart代码编写的API，以及针对Android（使用Java或Kotlin）和/或针对iOS（使用ObjC或Swift）平台的特定实现。一个具体的例子是battery插件包。
 
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('点击'),
          onPressed: (){
            int result = Calculator().addOne(1);
            print('使用package中的计算器计算结果:$result');
          },
        ),
      ),
    );
  }
}

