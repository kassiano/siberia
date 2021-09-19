import 'package:flutter_test/flutter_test.dart';
import 'package:siberia/siberia.dart';

void main() {
  group('Numeric matches test cases', () {
    test(
        'When String is null and orEmpty is called Then the result should be empty text',
        () {
      String? input;
      final result = input.orEmpty;
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
      expect(
          () => "x10".toInt(), throwsA(const TypeMatcher<FormatException>()));
    });

    test(
        'When String has a number value then toIntOrNull should return the converted int value',
        () {
      expect("10".tryToInt(), 10);
      expect("-10".tryToInt(), -10);
      expect("+10".tryToInt(), 10);
    });

    test(
        'When String has not a number value then toIntOrNull should return null',
        () {
      expect("x10".tryToInt(), null);
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
      expect(() => "x10".toDouble(),
          throwsA(const TypeMatcher<FormatException>()));
    });

    test(
        'When String has a number value then toDoubleOrNull should return the converted int value',
        () {
      expect("10".tryToDouble(), 10.0);
      expect("-10".tryToDouble(), -10.0);
      expect("+10".tryToDouble(), 10.0);
    });

    test(
        'When String has not a number value then toDoubleOrNull should return null',
        () {
      expect("x10".tryToDouble(), null);
    });
  });

  group('String manipulations and nullability test cases', () {
    test('Test of removeAllEmptySpaces extension', () {
      String test = '  Test String ';
      expect(test.withNoEmptySpaces, 'TestString');
    });

    test('Test of capitalize extension', () {
      String test = 'test sTring';
      expect(test.capitalize, 'Test sTring');
    });

    test('Test of dropFirstWord', () {
      String test = 'Hey, I am a sentence';
      expect(test.dropFirstWord, ', I am a sentence');
    });

    test('Test of firstWord', () {
      String test = 'Hey, I am a sentence';
      expect(test.firstWord, 'Hey');
    });

    test('Test of isNullable/isNotNullable', () {
      String? nullable;
      String empty = '';
      String notEmpty = 'Not empty';

      expect(nullable.isNullable, isTrue);
      expect(empty.isNullable, isTrue);
      expect(notEmpty.isNullable, isFalse);
      expect(notEmpty.isNotNullable, isTrue);
    });

    test('Test of isNumeric/isNonNumeric', () {
      String numeric = '1234';
      String nonNumeric = '1234a';

      expect(numeric.isNumeric, isTrue);
      expect(nonNumeric.isNonNumeric, isTrue);
    });

    test('Test of testNullability', () {
      const nullable = 'None';
      const nan = 'NaN';
      const nanLowerCase = 'nan';

      bool nanTester(String value) => value.toLowerCase() == 'nan';
      bool noneTester(String value) => value.toLowerCase() == 'none';

      expect(nullable.testNullability([nanTester]), isFalse);
      expect(nan.testNullability([nanTester]), isTrue);
      expect(nanLowerCase.testNullability([nanTester]), isTrue);
      expect(nullable.testNullability([nanTester, noneTester]), isTrue);
    });
  });
}
