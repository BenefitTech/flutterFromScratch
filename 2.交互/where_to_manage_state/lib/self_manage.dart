import 'package:flutter/material.dart';

/*
widget管理自己的状态
有时，widget在内部管理其状态是最好的。例如， 当ListView的内容超过渲染框时， ListView自动滚动。大多数使用ListView的开发人员不想管理ListView的滚动行为，因此ListView本身管理其滚动偏移量。

_SelfManageState 类:
  管理TapboxA的状态.
  定义_active：确定盒子的当前颜色的布尔值.
  定义_handleTap()函数，该函数在点击该盒子时更新_active,并调用setState()更新UI.
  实现widget的所有交互式行为.
 */

class SelfManageStateWidget extends StatefulWidget {
  SelfManageStateWidget({Key key}) : super(key: key);

  @override
  _SelfManageState createState() => _SelfManageState();
}

class _SelfManageState extends State<SelfManageStateWidget> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget 自己管理自己的state'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
