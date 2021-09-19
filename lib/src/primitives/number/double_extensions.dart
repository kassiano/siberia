import 'dart:math';

extension DoubleNullableExtension on double? {
  /// returns 0 if input value is null
  double get orZero => this ?? 0.0;
}

extension DoubleExtension on double {
  /// Cuts of decimals to match given precision decimals. It does not round.
  ///
  ///```dart
  /// double number = 10.1234;
  ///
  /// number.toPrecision(3) == 10.123;
  /// number.toPrecision(1) == 10.1;
  ///```
  double toPrecision(int fractionDigits) {
    double mod = pow(10, fractionDigits.toDouble()) as double;

    return ((this * mod).round().toDouble() / mod);
  }
}
