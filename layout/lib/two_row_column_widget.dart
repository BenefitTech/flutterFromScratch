/*
 * 
 * 最常见的布局模式之一是垂直或水平排列widget。您可以使用行(Row)水平排列widget，并使用列（Column）垂直排列widget。
 * 重点是什么？
    行和列是两种最常用的布局模式。
    行和列都需要一个子widget列表。
    子widget本身可以是行、列或其他复杂widget。
    您可以指定行或列如何在垂直或水平方向上对齐其子项
    您可以拉伸或限制特定的子widget.
    您可以指定子widget如何使用行或列的可用空间.

    对齐 widgets
      您可以控制行或列如何使用mainAxisAlignment和crossAxisAlignment属性来对齐其子项。
      也许你想要一个widget占据其兄弟widget两倍的空间。您可以将行或列的子项放置在Expandedwidget中， 以控制沿着主轴方向的widget大小。Expanded widget具有一个flex属性，它是一个整数，用于确定widget的弹性系数,默认弹性系数是1。
 */
import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/meinv1.jpg',
              width: 100.0,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'images/meinv2.jpg',
              width: 100.0,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'images/meinv3.jpg',
              width: 100.0,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    ));
  }
}
