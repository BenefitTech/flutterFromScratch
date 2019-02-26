import 'package:flutter/material.dart';

/*
 Material Components 库中的Card包含相关内容块，可以由大多数类型的widget构成，但通常与ListTile一起使用。
 Card有一个子项， 但它可以是支持多个子项的列，行，列表，网格或其他小部件。默认情况下，Card将其大小缩小为0像素。
 您可以使用SizedBox来限制Card的大小。

在Flutter中，Card具有圆角和阴影，这使它有一个3D效果。更改Card的eelevation属性允许您控制投影效果。
 例如，将elevation设置为24.0，将会使Card从视觉上抬离表面并使阴影变得更加分散。 有关支持的elevation值的列表，请参见Material guidelines中的Elevation and Shadows。 
 如果指定不支持的值将会完全禁用投影 。

 Card 摘要:
    实现了一个 Material Design card
    接受单个子项，但该子项可以是Row，Column或其他包含子级列表的widget
    显示圆角和阴影
    Card内容不能滚动
    Material Components 库的一个widget
 
 */

class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    var card = SizedBox(
      height: 210.0,
      width: 400,
      child: Card(
        elevation: 100.0,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '1652 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('My City , CA 99984'),
              leading: Icon(Icons.restaurant_menu, color: Colors.blue[500]),
            ),
            Divider(),
            ListTile(
              title: Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('costa@example.com'),
              leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      body: Center(child: card),
    );
  }
}

/*
ListTile
ListTile是Material Components库中的一个专门的行级widget，用于创建包含最多3行文本和可选的行前和行尾图标的行。
ListTile在Card或ListView中最常用，但也可以在别处使用。

ListTile 摘要:
  包含最多3行文本和可选图标的专用行
  比起Row不易配置，但更易于使用
  Material Components 库里的widget
 */