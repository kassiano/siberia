extension DoubleExtension on double? {
  /// returns 0 if input value is null
  double get orZero => this ?? 0.0;
}
