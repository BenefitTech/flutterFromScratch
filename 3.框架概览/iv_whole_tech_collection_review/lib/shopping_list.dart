import 'package:flutter/material.dart';
import 'shopping_list_item.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;
  
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
/*
1.state重用
ShoppingList类继承自StatefulWidget，这意味着这个widget可以存储状态。 
当ShoppingList首次插入到树中时，框架会调用其 createState 函数以创建一个新的_ShoppingListState实例来与该树中的相应位置关联（请注意，我们通常命名State子类时带一个下划线，这表示其是私有的）。 
当这个widget的父级重建时，父级将创建一个新的ShoppingList实例，但是Flutter框架将重用已经在树中的_ShoppingListState实例，而不是再次调用createState创建一个新的。

2.didUpdateWidget 重建widget时,监听
要访问当前ShoppingList的属性，_ShoppingListState可以使用它的widget属性。 
如果父级重建并创建一个新的ShoppingList，那么 _ShoppingListState也将用新的widget值重建（译者语：这里原文档有错误，应该是_ShoppingListState不会重新构建，但其widget的属性会更新为新构建的widget）。 
如果希望在widget属性更改时收到通知，则可以覆盖didUpdateWidget函数，以便将旧的oldWidget与当前widget进行比较。

3. setState的调用时机和作用
处理onCartChanged回调时，_ShoppingListState通过添加或删除产品来改变其内部_shoppingCart状态。
 为了通知框架它改变了它的内部状态，需要调用setState。
 调用setState将该widget标记为”dirty”(脏的)，并且计划在下次应用程序需要更新屏幕时重新构建它。 
 如果在修改widget的内部状态后忘记调用setState，框架将不知道您的widget是”dirty”(脏的)，并且可能不会调用widget的build方法，这意味着用户界面可能不会更新以展示新的状态。

通过以这种方式管理状态，您不需要编写用于创建和更新子widget的单独代码。相反，您只需实现可以处理这两种情况的build函数。


 */