import 'package:flutter/material.dart';

/*
1.介绍
Flutter Widget采用现代响应式框架构建，这是从 React 中获得的灵感，中心思想是用widget构建你的UI。
Widget描述了他们的视图在给定其当前配置和状态时应该看起来像什么。
当widget的状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同， 以确定底层渲染树从一个状态转换到下一个状态所需的最小更改（译者语：类似于React/Vue中虚拟DOM的diff算法）。
*/

void main() {
  runApp(Center(
    child: Text('最简单的hello world', textDirection: TextDirection.ltr),
  ));
}

/*
该runApp函数接受给定的Widget并使其成为widget树的根。 

在此示例中，widget树由两个widget:Center(及其子widget)和Text组成。
框架强制根widget覆盖整个屏幕，这意味着文本“Hello, world”会居中显示在屏幕上。
文本显示的方向需要在Text实例中指定，当使用MaterialApp时，文本的方向将自动设定，稍后将进行演示。

在编写应用程序时，通常会创建新的widget，这些widget是无状态的StatelessWidget或者是有状态的StatefulWidget， 具体的选择取决于您的widget是否需要管理一些状态。
widget的主要工作是实现一个build函数，用以构建自身。
一个widget通常由一些较低级别widget组成。
Flutter框架将依次构建这些widget，直到构建到最底层的子widget时，这些最低层的widget通常为RenderObject，它会计算并描述widget的几何形状。
*/
