import 'package:flutter/material.dart';

/*
 * 布局一个 widget
 * 重点是什么？
    即使应用程序本身也是一个 widget.
    创建一个widget并将其添加到布局widget中是很简单的.
    要在设备上显示widget，请将布局widget添加到 app widget中。
    使用Scaffold是最容易的，它是 Material Components库中的一个widget，它提供了一个默认banner，背景颜色，并且具有添加drawer，snack bar和底部sheet的API。
    如果您愿意，可以构建仅使用标准widget库中的widget来构建您的应用程序

    如何创建一个简单的widget并将其显示在屏幕上? 如下展示了一个简单的Hello World应用程序的完整代码,简单步骤概况如下:
    1.创建一个widget来容纳可见对象
    2.选择一个布局widget,并将可见widget添加到布局widget中. 
    3.将布局widget添加到页面
 * */

// 1.DisplayPage 相当于一个页面
class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('简单布局'),),
      // 2.内容容器
      body: Center(
        // 3.内容widget
        child: Text('布局内容'),
      ),

    );
  }
}

// 对于非Material应用程序，您可以将Center widget添加到应用程序的build()方法中：
// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
 class DisplayPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Center(
        child: Text('非material页面',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40.0,color: Colors.black87),),
      ),
    );
  }
 }