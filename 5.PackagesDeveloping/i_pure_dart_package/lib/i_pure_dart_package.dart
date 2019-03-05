library i_pure_dart_package;

/*
Developing Dart packages
Step 1: 开发Dart包
要创建Dart包，请使用--template=package 来执行 flutter create
  flutter create --template=package hello
这将在hello/文件夹下创建一个具有以下专用内容的package工程：

  lib/hello.dart:
    Package的Dart代码
  test/hello_test.dart:
    Package的单元测试代码.

Step 2: 实现package
对于纯Dart包，只需在主lib/<package name>.dart文件内或lib目录中的文件中添加功能 。
要测试软件包，请在test目录中添加unit tests。
有关如何组织包内容的更多详细信息，请参阅Dart library package文档。
 */

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
