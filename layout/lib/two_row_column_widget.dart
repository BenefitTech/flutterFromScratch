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

// 主轴方向均分空间--对齐
class RowDemoMainAxisSpaceEvenly extends StatelessWidget {
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

// 交叉轴方向上居中+expand --- 调整大小
class RowDemoExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset('images/meinv1.jpg'),
            ),
            Expanded(
              flex: 2,
              child: Image.asset('images/meinv2.jpg'),
            ),
            Expanded(
              child: Image.asset('images/meinv3.jpg'),
            )
          ],
        ),
      ),
    ));
  }
}

// 聚集widgets,默认情况下,Row方向布局时,占满一行空间,使用MainAxisSize.min,可以让父控件跟随子控件大小
class RowDemoMainAxisSizeMin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Colors.grey[500]),
              Icon(Icons.star, color: Colors.grey[300]),
              Icon(Icons.star, color: Colors.grey[400]),
              Icon(Icons.star, color: Colors.grey),
              Icon(Icons.star, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// 嵌套行和列
class RowDemoNestingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ratings = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Colors.red),
              Icon(Icons.star, color: Colors.red[200]),
              Icon(Icons.star, color: Colors.red[300]),
              Icon(Icons.star, color: Colors.red[400]),
              Icon(Icons.star, color: Colors.red[500]),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0),
          )
        ],
      ),
    );

    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    var iconList = DefaultTextStyle(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min')
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    var leftColum = Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Strawberry Pavlova'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Palova . Pavlava features a crisp crust.......'),
          ),
          ratings,
          iconList,
        ],
      ),
    );

    return Scaffold(
      body:Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600.0,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 400.0,
                  child: leftColum,
                ),
                Expanded(child: Image.asset('images/meinv1.jpg'),)
                
              ],
            ),
          ),
        ),));
  }
}
