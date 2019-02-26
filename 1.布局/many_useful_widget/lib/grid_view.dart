import 'package:flutter/material.dart';

/*
GridView 概览:
  在网格中放置widget
  检测列内容超过渲染框时自动提供滚动
  构建您自己的自定义grid，或使用一下提供的grid之一:
    GridView.count 允许您指定列数
    GridView.extent 允许您指定项的最大像素宽度
  
 */

List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(
      count,
      (int index) => Container(
        color: Colors.green[200],
          child:  Image.asset('images/meinv${index + 1}.jpg')));
}

Widget _buildGrid() {
  return GridView.extent(
    maxCrossAxisExtent: 250.0, // 创建最大宽度为150像素的网格
    padding: EdgeInsets.all(8.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(6),
  );
}

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gridView 学习'),
      ),
      body: Center(
        child: _buildGrid(),
      ),
    );
  }
}
