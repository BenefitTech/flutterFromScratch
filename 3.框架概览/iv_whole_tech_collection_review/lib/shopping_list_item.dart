import 'package:flutter/material.dart';

class Product {
  Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) {
      return null;
    }
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}



class ShoppingListItemSuperWidget extends StatefulWidget {
  @override
  _ShoppingListItemSuperWidgetState createState() => _ShoppingListItemSuperWidgetState();
}

class _ShoppingListItemSuperWidgetState extends State<ShoppingListItemSuperWidget> {
  bool _inCart = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShoppingListItem(
          product: Product(name: '狗熊'),
          inCart: _inCart,
          onCartChanged: (Product product, bool inCart) {
            print('点击了${product.name}');
            /*
            当父项收到onCartChanged回调时，父项将更新其内部状态，这将触发父项使用新inCart值重建ShoppingListItem新实例。 
            虽然父项ShoppingListItem在重建时创建了一个新实例，但该操作开销很小，因为Flutter框架会将新构建的widget与先前构建的widget进行比较，并仅将差异部分应用于底层RenderObject。
             */
            setState(() {
              _inCart = !_inCart;
            });
          },
        ),
      ),
    );
  }
}
