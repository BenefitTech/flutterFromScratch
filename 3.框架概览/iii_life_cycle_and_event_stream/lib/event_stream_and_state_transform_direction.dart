import 'package:flutter/material.dart';

/*
在Flutter中，事件流是“向上”传递的，而状态流是“向下”传递的（译者语：这类似于React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态），重定向这一流程的共同父元素是State。
让我们看看这个稍微复杂的例子是如何工作的：
 */

// 状态量
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

// 事件
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class CounterMixWidget extends StatefulWidget {
  @override
  _CounterMixWidgetState createState() => _CounterMixWidgetState();
}

class _CounterMixWidgetState extends State<CounterMixWidget> {
  int _counter = 0;
  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CounterDisplay(count: _counter),
            CounterIncrementor(onPressed: _increment)
          ],
        ),
      ),
    );
  }
}
