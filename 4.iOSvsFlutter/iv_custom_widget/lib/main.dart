import 'package:flutter/material.dart';
import 'custom_widget.dart';


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                margin: EdgeInsets.only(top:60),
                color: Colors.red,
                child: Text('透明度修改'),
                width: 150,
                height: 200,
              ),
            ),
            CustomButton('自定义widget')
          ],
        ),
      ),
    );
  }
 
}

