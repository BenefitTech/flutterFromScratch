import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: RaisedButton(
            child: Text('返回'),
            onPressed: () {
              print('返回');
              // Navigator.of(context).pop('返回参数');
              Navigator.pop(context, 'returnsth');
            },
          ),
        ),
      ),
    );
  }
}
