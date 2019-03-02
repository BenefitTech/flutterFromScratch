import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('加载json'),
                onPressed: () {
                  var json = loadAsset();
                  print(json.toString());
                },
              ),
              Container(
                width: 200,
                height: 150,
                child: Image.network(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551528027807&di=dee14ff3efbe38fd78a731ec2af1213b&imgtype=0&src=http%3A%2F%2Fpic29.nipic.com%2F20130531%2F8786105_102319220000_2.jpg'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('my-assets/data.json');
  }
}
