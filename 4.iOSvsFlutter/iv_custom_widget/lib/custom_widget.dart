import 'package:flutter/material.dart';

/*
在 iOS 中，你编写 UIView 的子类，或使用已经存在的 view 来重载并实现方法，以达到特定的功能。在 Flutter 中，你会组合（composing）多个小的 widgets 来构建一个自定义的 widget（而不是扩展它）。
举个例子，如果你要构建一个 CustomButton ，并在构造器中传入它的 label？那就组合 RaisedButton 和 label，而不是扩展 RaisedButton。
 */

class CustomButton extends StatelessWidget{
  CustomButton(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){},child: Text(label),);
  }
}