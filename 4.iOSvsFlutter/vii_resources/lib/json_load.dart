import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;
/*
每个 Flutter 应用程序都有一个 rootBundle 对象， 可以轻松访问主资源包，也可以直接使用 package:flutter/services.dart 中全局静态的rootBundle 对象来加载 asset。
但是，建议使用 DefaultAssetBundle.of 来获取当前 BuildContext 的 AssetBundle。这种方法不是使用应用程序构建的默认 asset bundle，而是使父级 widget 在运行时替换的不同的 AssetBundle ，这在本地化或测试时很有用。

 */
class JSONLoadView extends StatefulWidget {
  @override
  _JSONLoadViewState createState() => _JSONLoadViewState();
}

class _JSONLoadViewState extends State<JSONLoadView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('my-assets/data.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> data = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Text('Name:${data[index]['name']}'),
                    Text('Age:${data[index]['age']}'),
                    Text('Height:${data[index]['height']}'),
                    Text('Gender:${data[index]['gender']}'),
                  ],
                ),
              );
            },
          );
        }

        return CircularProgressIndicator();
      },
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('my-assets/data.json');
  }
}
