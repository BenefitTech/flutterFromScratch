import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _typeController = TextEditingController();
  String _showText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: Container(
        height: 1000,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _typeController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型'),
              autofocus: false,
            ),
            RaisedButton(
              onPressed: _choiceAction,
              child: Text('选择完毕'),
            ),
            Text(
              _showText,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }

  _choiceAction() {
    if (_typeController.text == '') {
      setState(() {
        _showText = '';
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('美女类型不能为空')),
      );
    } else {
      getHttp(_typeController.text).then((value) {
        setState(() {
          _showText = value['data']['name'].toString();
        });
      });
    }
  }

  // https://segmentfault.com/a/1190000014396421
  Future getHttp(String typeText) async {
    try {
      var params = {'name': typeText};
      Response response = await Dio().get(
          'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian',
          queryParameters: params);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
