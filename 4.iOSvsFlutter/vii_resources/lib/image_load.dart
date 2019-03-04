import 'package:flutter/material.dart';
import './const/Strings.dart';

/*
对于图片，Flutter 像 iOS 一样，遵循了一个简单的基于像素密度的格式。Image assets 可能是 1.0x 2.0x 3.0x 或是其他的任何倍数。这些所谓的 devicePixelRatio 传达了物理像素到单个逻辑像素的比率。

Assets 可以被放置到任何属性文件夹中——Flutter 并没有预先定义的文件结构。在 pubspec.yaml 文件中声明 assets （和位置），然后 Flutter 会把他们识别出来。

举个例子，要把一个叫 my_icon.png 的图片放到 Flutter 工程中，你可能想要把存储它的文件夹叫做 images。把基础图片（1.0x）放置到 images 文件夹中，并把其他变体放置在子文件夹中，并接上合适的比例系数：

 */
class ImageLoadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(Strings.shareWechat),
          Image(
            image: AssetImage(Strings.shareQQ),
          )
        ],
      ),
    );
  }
}
