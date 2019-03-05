import 'package:flutter_test/flutter_test.dart';

import 'package:i_pure_dart_package/i_pure_dart_package.dart';

void main() {
//   test('adds one to input values', () {
//     final calculator = Calculator();
//     expect(calculator.addOne(2), 3);
//     expect(calculator.addOne(-7), -6);
//     expect(calculator.addOne(0), 1);
//     expect(() => calculator.addOne(null), throwsNoSuchMethodError);
//     print('test end');
//   });
  // 单元测试:

  group('Calculate test--', () {
    test('adds one to input values', () {
      final calculator = Calculator();
      expect(calculator.addOne(2), 3);
      expect(calculator.addOne(-7), -6);
      expect(calculator.addOne(0), 1);
      expect(() => calculator.addOne(null), throwsNoSuchMethodError);
    });

    test('exception test', (){
      final cal =Calculator();
      expect(cal.addOne(null), 1);
    });
  });
}
