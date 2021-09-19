import 'package:flutter_test/flutter_test.dart';
import 'package:siberia/siberia.dart';

void main() {

  test('When int is null and orZero is called Then the result should 0', () {
    int? input;
    final result = input.orZero();
    expect(result, 0);
  });

  test('When double is null and orZero is called Then the result should 0', () {
    double? input;
    final result = input.orZero();
    expect(result, 0.0);
  });

}
