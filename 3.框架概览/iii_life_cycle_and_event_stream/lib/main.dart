import 'package:flutter/material.dart';
import 'widget_state_life_cycle.dart';
import 'event_stream_and_state_transform_direction.dart';


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
      // home: Counter()
      home: CounterMixWidget(),
    );
  }
}

