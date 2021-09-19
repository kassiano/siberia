import 'package:flutter_test/flutter_test.dart';
import 'package:siberia/siberia.dart';

void main() {
  // 2020-01-01
  final date = DateTime.parse('20200101');

  test('Test tomorrow', () {
    expect(date.tomorrow, date.add(const Duration(days: 1)));
  });

  test('Test yesterday', () {
    expect(date.yesterday, date.subtract(const Duration(days: 1)));
  });
}
