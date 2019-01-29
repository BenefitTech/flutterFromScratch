import 'package:flutter/material.dart';
import 'home.dart';
import 'random_words.dart';
import 'random_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: RandomWordsList(),
      
      
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     child: RandomWords(),
      //   ),

      // )
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


