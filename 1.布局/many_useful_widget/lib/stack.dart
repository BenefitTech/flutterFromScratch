import 'package:flutter/material.dart';

/**
 * 
  用于与另一个widget重叠的widget
  子列表中的第一个widget是base widget; 随后的子widget被覆盖在基础widget的顶部
  Stack的内容不能滚动
  您可以选择剪切超过渲染框的子项
 * 
 */
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/meinv2.jpg'),
                radius: 100.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Text('Mia B',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                ),
              )
            ],
          )
      ),
    );
  }
}
