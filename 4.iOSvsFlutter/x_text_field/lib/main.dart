import 'package:flutter/material.dart';

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
      home: MyFormWidget(),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formController = TextEditingController();
  String _errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _formController,
          decoration: InputDecoration(hintText: '我是占位符,哈哈哈!',errorText: _getErrorText()),
          onSubmitted: (String text){
            setState(() {
              if (!_isEmail(text)) {
                _errorText = 'Error: This is not an email';
              }else{
                _errorText =null;
              }
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(_formController.text),
              );
            }
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }

  _getErrorText(){
    return _errorText;
  }
  bool _isEmail(String em){
    String emailRegexp =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp =RegExp(emailRegexp);

    return regExp.hasMatch(em);

  }

  @override
  void dispose() {
    _formController.dispose();

    super.dispose();
  }
}
