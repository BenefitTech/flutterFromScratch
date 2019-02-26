import 'package:flutter/material.dart';

/*
父widget管理widget的state
对于父widget来说，管理状态并告诉其子widget何时更新通常是最有意义的。 例如，IconButton允许您将图标视为可点按的按钮。 IconButton是一个无状态的小部件，因为我们认为父widget需要知道该按钮是否被点击来采取相应的处理。

在以下示例中，TapboxB通过回调将其状态导出到其父项。由于TapboxB不管理任何状态，因此它的父类为StatelessWidget。

ParentWidgetState 类:
  为TapboxB 管理_active状态.
  实现_handleTapboxChanged()，当盒子被点击时调用的方法.
  当状态改变时，调用setState()更新UI.

TapboxB 类:
  继承StatelessWidget类，因为所有状态都由其父widget处理.
  当检测到点击时，它会通知父widget.
 */

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('父widegt管理state'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            child: Center(
              child: Text(
                active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                color: active ? Colors.lightGreen[700] : Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
