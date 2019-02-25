import 'package:flutter/material.dart';
import 'test_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout 学习',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TestImage(),
    );
  }
}
