import 'package:flutter/material.dart';

class TestImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        // padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.brown,
              alignment: Alignment.center,
              child: Text(
                'Test Text',
                style: TextStyle(color: Colors.indigo, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            )),
            Image.asset(
              'images/lake.jpg',
              // width: 300.0,
              height: 200.0,
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ),
    );
  }
}
