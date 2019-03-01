import 'package:flutter/material.dart';
import 'green_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        // 1.map中配置路由
        '/green': (BuildContext context) => GreenPage()
      },
    );
  }
}
/*
导航到新页面并返回
  1.起始位置routes中通过Map定义;
  2.直接创建
给新页面传值
从新页面返回数据给上一个页面

 */

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 这里需要使用builder,传入的context才能被后面的showSnackBar使用,否则报错:Unhandled Exception: Scaffold.of() called with a context that does not contain a Scaffold.
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: RaisedButton(
            child: Text('跳转到新页面'),
            onPressed: () {
              // 通过路由名字跳转新路由
              // Navigator.of(context).pushNamed('/green');
              // 2.直接创建路由并跳转
              _navigateToGreenPage(context);
            },
          ),
        );
      }),
    );
  }

  _navigateToGreenPage(BuildContext context) async {

    // 3.新页面传值
    // 4.接收新页面返回值
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => GreenPage(parameter: '传入参数')));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}
