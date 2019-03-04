import 'package:flutter/material.dart';
/*
使用 GestureDetector 你可以监听更广阔范围内的手势，比如：

Tapping
  onTapDown — 在特定位置轻触手势接触了屏幕。
  onTapUp — 在特定位置产生了一个轻触手势，并停止接触屏幕。
  onTap — 产生了一个轻触手势。
  onTapCancel — 触发了 onTapDown 但没能触发 tap。

Double tapping
  onDoubleTap — 用户在同一个位置快速点击了两下屏幕。

Long pressing
  onLongPress — 用户在同一个位置长时间接触屏幕。

Vertical dragging
  onVerticalDragStart — 接触了屏幕，并且可能会垂直移动。
  onVerticalDragUpdate — 接触了屏幕，并继续在垂直方向移动。
  onVerticalDragEnd — 之前接触了屏幕并垂直移动，并在停止接触屏幕前以某个垂直的速度移动。
  
Horizontal dragging
  onHorizontalDragStart — 接触了屏幕，并且可能会水平移动。
  onHorizontalDragUpdate — 接触了屏幕，并继续在水平方向移动。
  onHorizontalDragEnd — 之前接触屏幕并水平移动的触摸点与屏幕分离。

下面这个例子展示了一个 GestureDetector 是如何在双击时旋转 Flutter 的 logo 的：
 */
class EventHandleAndAnimation extends StatefulWidget {
  @override
  _EventHandleAndAnimationState createState() =>
      _EventHandleAndAnimationState();
}

class _EventHandleAndAnimationState extends State<EventHandleAndAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: RotationTransition(
            turns: _curve,
            child: FlutterLogo(
              size: 200.0,
            ),
          ),
          onDoubleTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }
}
