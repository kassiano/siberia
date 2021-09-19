library number;

extension NullableIntExtensions on int? {

  /// returns 0 if input value is null
  int orZero() {
    return this ?? 0;
  }

}

extension NullableDoubleExtensions on double? {

  /// returns 0 if input value is null
  double orZero() {
    return this ?? 0.0;
  }

}