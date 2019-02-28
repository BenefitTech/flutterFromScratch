import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
      home: SampleAppPage(),
    );
  }
}

/*
我怎么在我的约束中添加或移除组件？
在 iOS 中，你在父 view 中调用 addSubview() 或在子 view 中调用 removeFromSuperview() 来动态地添加或移除子 views。
在 Flutter 中，由于 widget 不可变，所以没有和 addSubview() 直接等价的东西。
作为替代，你可以向 parent 传入一个返回 widget 的函数，并用一个布尔值来控制子 widget 的创建。
 */
class SampleAppPage  extends StatefulWidget{
  SampleAppPage({Key key}):super(key:key);
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage>{

  bool _toggle =true;

  void _toggleAction(){
    setState(() {
      _toggle = !_toggle;
    });
  }

  Widget _getToggleChild(){
    if (_toggle) {
      return Text('Toggle One');
    }else{
      return CupertinoButton(
        onPressed: (){
          print('点击Toggle two button');
        },
        child: Text('Toggle Two'),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAction,
        tooltip: 'Update text',
        child: Icon(Icons.update),
      ),
    );
  }
}




