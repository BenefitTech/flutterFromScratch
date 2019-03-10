/*
解码 HTTPS GET请求的JSON
以下示例显示了如何在Flutter应用中对HTTPS GET请求返回的JSON数据进行解码
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioPage extends StatefulWidget {
  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  var _ipAddress = 'Unknown';
  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    Response response = await Dio().get(url);
    Map jsonData = response.data;

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = jsonData['origin'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(
      height: 32.0,
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your current IP address is:'),
            Text('$_ipAddress'),
            spacer,
            RaisedButton(
              onPressed: _getIPAddress,
              child: Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
