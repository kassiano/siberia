extension IntExtension on int? {
  /// returns 0 if input value is null
  int get orZero => this ?? 0;
}
