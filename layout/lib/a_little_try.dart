import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 3.Container也是一个widget，允许您自定义其子widget。如果要添加填充，边距，边框或背景色，请使用Container来设置
                // Text一般放在Container中,以便于添加边框
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Kandersteg,Switzerland',
                    style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL', color),
          buildButtonColumn(Icons.near_me, 'ROUTE', color),
          buildButtonColumn(Icons.share, 'SHARE', color),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text('''
        Lake Oeschinen lies at the foot of the Bluemlisalp in the bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        '''),
    );

      // 2.每个页面有需要使用Scaffold 包裹
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 0.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'images/lake.jpg',
                    height: 240.0,
                    // width: 600.0,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      );
  }

  Column buildButtonColumn(IconData icon, String label, Color color) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              )),
        )
      ],
    );
  }
}