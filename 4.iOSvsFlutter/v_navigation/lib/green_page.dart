import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  GreenPage({Key key ,@required this.parameter}):super(key:key);
  final String parameter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: RaisedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('返回'),
                Text('$parameter')
              ],
            ),
            onPressed: () {

              print('返回');
              // 5.pop回去
              // Navigator.of(context).pop('返回参数');
              Navigator.pop(context, '返回参数');
            },
          ),
        ),
      ),
    );
  }
}
