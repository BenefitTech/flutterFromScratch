import 'package:flutter/material.dart';

class FontsLoadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'font load test',
          style: TextStyle(
            fontFamily: 'Charmonman',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "\u{e7d7}",
          style: TextStyle(
            fontFamily: "Iconfont",
            fontSize: 36.0,
          ),
        )
      ],
    );
  }
}
