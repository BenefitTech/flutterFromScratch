import 'package:flutter/material.dart';

/*
许多布局会自由使用容器来使用padding分隔widget，或者添加边框（border）或边距（margin）。
您可以通过将整个布局放入容器并更改其背景颜色或图片来更改设备的背景。

---------------------------
|         margin           |
|  ---------------------   |
|  |       border       |  |
|  |  ----------------- |  |
|  |  |     padding     |  |
|  |  | --------------  |  |
|  |  | |   content   | |  |
|  |  | |             | |  |
|  |  | --------------- |  |
|  |                    |  |
|  ----------------------  |
|                          |
----------------------------

*/

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器widget学习'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black26),
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                imageWidget('images/meinv1.jpg'),
                imageWidget('images/meinv2.jpg'),
              ],
            ),
            Row(
              children: <Widget>[
                imageWidget('images/meinv3.jpg'),
                imageWidget('images/meinv2.jpg'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget(String imageName) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 10.0, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        margin: EdgeInsets.all(8.0),
        child: Image.asset(imageName),
      ),
    );
  }
}
