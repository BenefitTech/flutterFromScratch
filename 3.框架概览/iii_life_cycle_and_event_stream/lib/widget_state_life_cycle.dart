import 'package:flutter/material.dart';

/*
您可能想知道为什么StatefulWidget和State是单独的对象。
在Flutter中，这两种类型的对象具有不同的生命周期： 
  Widget是临时对象，用于构建当前状态下的应用程序，而State对象在多次调用build()之间保持不变，允许它们记住信息(状态)。
 */

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _increment,
              child: Text('Increment'),
            ),
            Text('Count: $_counter')
          ],
        ),
      ),
    );
  }
}
