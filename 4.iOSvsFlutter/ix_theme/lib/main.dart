import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
我怎么给 App 设置主题？
Flutter 实现了一套漂亮的 MD 组件，并且开箱可用。它接管了一大堆你需要的样式和主题。

为了充分发挥你的 App 中 MD 组件的优势，声明一个顶级 widget，MaterialApp，用作你的 App 入口。
MaterialApp 是一个便利组件，包含了许多 App 通常需要的 MD 风格组件。它通过一个 WidgetsApp 添加了 MD 功能来实现。

但是 Flutter 足够地灵活和富有表现力来实现任何其他的设计语言。
在 iOS 上，你可以用 Cupertino library 来制作遵守  Human Interface Guidelines 的界面。
查看这些 widget 的集合，请参阅 Cupertino widgets gallery。

你也可以在你的 App 中使用 WidgetApp，它提供了许多相似的功能，但不如 MaterialApp 那样强大。
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.red
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
