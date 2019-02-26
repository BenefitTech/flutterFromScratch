/*

混合管理
对于一些widget来说，混搭管理的方法最有意义的。在这种情况下，有状态widget管理一些状态，并且父widget管理其他状态。

在TapboxC示例中，点击时，盒子的周围会出现一个深绿色的边框。点击时，边框消失，盒子的颜色改变。 TapboxC将其_active状态导出到其父widget中，但在内部管理其_highlight状态。这个例子有两个状态对象_ParentWidgetState和_TapboxCState。

_ParentWidgetState 对象:
  管理_active 状态.
  实现 _handleTapboxChanged(), 当盒子被点击时调用.
  当点击盒子并且_active状态改变时调用setState()更新UI

_TapboxCState 对象:
  管理_highlight state.
  GestureDetector监听所有tap事件。当用户点下时，它添加高亮（深绿色边框）；当用户释放时，会移除高亮。
  当按下、抬起、或者取消点击时更新_highlight状态，调用setState()更新UI。
  当点击时，将状态的改变传递给父widget.

 */
import 'package:flutter/material.dart';

class MixParentWidget extends StatefulWidget {
  @override
  _MixParentWidgetState createState() => _MixParentWidgetState();
}

class _MixParentWidgetState extends State<MixParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('父widget和自己混合管理state'),
      ),
      body: Center(
        child: Container(
          child: _TapboxC(onChanged: _handleTapboxChanged, active: _active),
        ),
      ),
    );
  }
}

class _TapboxC extends StatefulWidget {
  _TapboxC({Key key, this.active = false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<_TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10.0)
                : null),
      ),
    );
  }
}
