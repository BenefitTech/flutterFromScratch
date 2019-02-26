import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyScaffold(),
    );
  }
}
/*
为了继承主题数据，widget需要位于MaterialApp内才能正常显示， 因此我们使用MaterialApp来运行该应用。

在MyAppBar中创建一个Container，高度为56像素（像素单位独立于设备，为逻辑像素），其左侧和右侧均有8像素的填充。在容器内部， MyAppBar使用Row 布局来排列其子项。 
中间的title widget被标记为Expanded, ，这意味着它会填充尚未被其他子项占用的的剩余可用空间。
Expanded可以拥有多个children， 然后使用flex参数来确定他们占用剩余空间的比例。

MyScaffold 通过一个Column widget，在垂直方向排列其子项。
在Column的顶部，放置了一个MyAppBar实例，将一个Text widget作为其标题传递给应用程序栏。
将widget作为参数传递给其他widget是一种强大的技术，可以让您创建各种复杂的widget。
最后，MyScaffold使用了一个Expanded来填充剩余的空间，正中间包含一条message。 
*/

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key, this.title}) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）,这样适配有问题!!
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello world!'),
            ),
          )
        ],
      ),
    );
  }
}

