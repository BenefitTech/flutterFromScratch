import 'package:flutter/material.dart';

/*

我怎么给 Flutter 的 widget 添加一个点击监听者？
在 iOS 中，你给一个 view 添加 GestureRecognizer 来处理点击事件。
在 Flutter 中，有两种方法来添加点击监听者：

1.如果 widget 本身支持事件监测，直接传递给它一个函数，并在这个函数里实现响应方法。
例如，RaisedButton widget 拥有一个 RaisedButton 参数：
 */

class SupportEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('widget自带事件回调函数'),
          onPressed: () {
            print('点击事件');
          },
        ),
      ),
    );
  }
}

/*
2.如果 widget 本身不支持事件监测，则在外面包裹一个 GestureDetector，并给它的 onTap 属性传递一个函数：
 */

class WrappedGestureRecognizeWidet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: FlutterLogo(
            size: 200,
          ),
          onTap: () {
            print('点击了');
          },
        ),
      ),
    );
  }
}
