extension DateExtension on DateTime {
  /// Adds one day to this [DateTime].
  DateTime get tomorrow => add(const Duration(days: 1));

  /// Subtracts one day to this [DateTime].
  DateTime get yesterday => subtract(const Duration(days: 1));
}
