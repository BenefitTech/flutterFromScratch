import 'package:flutter/material.dart';
import 'shopping_list_item.dart';
import 'shopping_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ShoppingListItemSuperWidget(),
      home: ShoppingList(
        products: <Product>[
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}

/*
您可以使用key来控制框架将在widget重建时与哪些其他widget匹配。
默认情况下，框架根据它们的runtimeType和它们的显示顺序来匹配。 
使用key时，框架要求两个widget具有相同的key和runtimeType。

Key在构建相同类型widget的多个实例时很有用。例如，ShoppingList构建足够的ShoppingListItem实例以填充其可见区域：
  如果没有key，当前构建中的第一个条目将始终与前一个构建中的第一个条目同步，即使在语义上，列表中的第一个条目如果滚动出屏幕，那么它将不会再在窗口中可见。
  通过给列表中的每个条目分配为“语义” key，无限列表可以更高效，因为框架将同步条目与匹配的语义key并因此具有相似（或相同）的可视外观。 
  此外，语义上同步条目意味着在有状态子widget中，保留的状态将附加到相同的语义条目上，而不是附加到相同数字位置上的条目。
 
全局 Key
主要文章: GlobalKey
  您可以使用全局key来唯一标识子widget。全局key在整个widget层次结构中必须是全局唯一的，这与局部key不同，后者只需要在同级中唯一。
  由于它们是全局唯一的，因此可以使用全局key来检索与widget关联的状态。


 
 */
