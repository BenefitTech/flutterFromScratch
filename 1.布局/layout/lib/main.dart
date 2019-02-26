import 'package:flutter/material.dart';
import 'one_simple_display_widget.dart';
import 'two_row_column_widget.dart';

void main() => runApp(MyApp());
// 布局widget类型:
/** 
 *  MetiarialApp, CupertinoApp
 *  Scaffold
 *  Container,Expanded,
 *  Row ,Column
 *  Image , Icon,Text,ListView,
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    

    // 1.每个app需要选择一种设计样式: MaterialApp或者CupertinoApp
    // return MaterialApp(
    //   title: 'Flutter layout practice',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),

    //   // 2.每个页面有需要使用Scaffold 包裹
    //   home: DemoPage()
    // );

    // 2.简单布局使用
    // return MaterialApp(
    //   home: DisplayPage(),
    // );
    // return DisplayPage1();

    // 3.行列布局
    return MaterialApp(
      home: RowDemoNestingWidgets(),
    );
  }

  
}
