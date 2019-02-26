import 'package:flutter/material.dart';
import 'self_manage.dart';
import 'parent_widget_manage.dart';
import 'mix_manage.dart';

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
      // home:SelfManageStateWidget()
      // home: ParentWidget(),
      home:MixParentWidget()
    );
  }
}

/*
管理状态
  重点是什么?
    有多种方法可以管理状态.
    选择使用何种管理方法
    如果不是很清楚时, 那就在父widget中管理状态吧.
  
谁管理着stateful widget的状态？widget本身？父widget？都会？另一个对象？答案是……这取决于实际情况。 
有几种有效的方法可以给你的widget添加互动。作为小部件设计师。以下是管理状态的最常见的方法：
  widget管理自己的state
  父widget管理 widget状态
  混搭管理（父widget和widget自身都管理状态））

如何决定使用哪种管理方法？以下原则可以帮助您决定：
  如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父widget管理
  如果所讨论的状态是有关界面外观效果的，例如动画，那么状态最好由widget本身来管理.
 */

