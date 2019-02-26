import 'package:flutter/material.dart';

/*
 * ListView 摘要:
    用于组织盒子中列表的特殊Column
    可以水平或垂直放置
    检测它的内容超过显示框时提供滚动
    比Column配置少，但更易于使用并支持滚动
 */

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: _list,
        ),
      ),
    );
  }
}

List<Widget> _list = <Widget>[
  ListTile(
    title: Text('CineArts at the Empire',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
    subtitle: Text('85 W Portal Ave'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('The Castro Theater',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
    subtitle: Text('429 Castro St'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  ListTile(
    title: Text('北京全聚德',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
    subtitle: Text('北京市xxx路yyy街道'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  )
];
