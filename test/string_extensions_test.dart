import 'package:flutter_test/flutter_test.dart';
import 'package:siberia/siberia.dart';

void main() {
  test(
      'When String is null and orEmpty is called Then the result should be empty text',
      () {
    String? input;
    final result = input.orEmpty();
    expect(result, "");
  });

  test(
      'When String has a number value then toInt should return the converted int value',
      () {
    expect("10".toInt(), 10);
    expect("-10".toInt(), -10);
    expect("+10".toInt(), 10);
  });

  //int tests
  test(
      'When String has not a number value then toInt should throws a format exception',
      () {
    expect(() => "x10".toInt(), throwsA(const TypeMatcher<FormatException>()));
  });

  test(
      'When String has a number value then toIntOrNull should return the converted int value',
      () {
    expect("10".toIntOrNull(), 10);
    expect("-10".toIntOrNull(), -10);
    expect("+10".toIntOrNull(), 10);
  });

  test('When String has not a number value then toIntOrNull should return null',
      () {
    expect("x10".toIntOrNull(), null);
  });

  //double tests
  test(
      'When String has a number value then toDouble should return the converted double value',
      () {
    expect("10.0".toDouble(), 10.0);
    expect("10".toDouble(), 10.0);
    expect("-10".toDouble(), -10.0);
    expect("+10".toDouble(), 10.0);
  });

  test(
      'When String has not a number value then toDouble should throws a format exception',
      () {
    expect(
        () => "x10".toDouble(), throwsA(const TypeMatcher<FormatException>()));
  });

  test(
      'When String has a number value then toDoubleOrNull should return the converted int value',
      () {
    expect("10".toDoubleOrNull(), 10.0);
    expect("-10".toDoubleOrNull(), -10.0);
    expect("+10".toDoubleOrNull(), 10.0);
  });

  test(
      'When String has not a number value then toDoubleOrNull should return null',
      () {
    expect("x10".toDoubleOrNull(), null);
  });
}
