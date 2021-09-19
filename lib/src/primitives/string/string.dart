library string;

extension NullableStringExtensions on String? {
  /// returns a empty text if input value is null
  String get orEmpty => this ?? "";
}

extension StringConvertions on String {
  /// convert a string in and int value if is possible
  /// throws a [FormatException] is string content is not a number value
  int toInt() => int.parse(this);

  /// convert a [String] in and nullable [int] value
  /// if the input value could be converted to int then it will return the converted value
  /// when input value could not be converted to int then it will return null
  int? tryToInt() => int.tryParse(this);

  /// convert a string in and [double] value if is possible
  /// throws a [FormatException] is string content is not a number value
  double toDouble() => double.parse(this);

  /// convert a [String] in and nullable [double] value
  /// if the input value could be converted to int then it will return the converted value
  /// when input value could not be converted to int then it will return null
  double? tryToDouble() => double.tryParse(this);
}
