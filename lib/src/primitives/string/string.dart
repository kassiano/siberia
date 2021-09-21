library string;

extension NullableStringExtensions on String? {
  /// returns a empty text if input value is null
  String get orEmpty => this ?? "";

  /// Checks if a string can be considered null given a certain rules
  ///  - A String is null
  ///  - A String has a value set as an empty character
  ///
  /// Returns in `boolean` if the string is null or empty.
  ///
  /// ```dart
  /// final String empty;
  ///
  /// empty.isNullable -> true;
  /// ```
  bool get isNullable => this == null || this!.trim().isEmpty;

  /// The inverse of [isNullable]
  ///
  /// ```dart
  /// final String notEmpty = 'Not Empty';
  ///
  /// notEmpty.isNotNullable -> true;
  /// ```
  bool get isNotNullable => !isNullable;

  /// Tests a `nullability` of any string following the base nullability
  /// rule, plus a list of any nullable comparators. If the value is nullable
  /// or matches any of the nullable values, returns true;
  ///
  /// If no parameters are passed, has the same effect as [String.isNullable]
  ///
  /// ```dart
  /// final String nullable = 'None';
  ///
  /// nullable.testNullability() -> false;
  /// nullable.testNullability(['None']) -> true;
  /// ```
  ///
  /// ! ATTENTION: This method is case sensitive
  bool testNullability([List<StringTester> nullabilityRules = const []]) {
    if (isNullable) return true;

    return nullabilityRules.firstWhere(
          (rule) => rule(this!) == true,
          orElse: () => null,
        ) !=
        null;
  }
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

/// Definition of a String method tester
///
/// By default, describes a method that receives a [String] to test and
/// returns a [bool] that validates if the test succeeded or not
typedef StringTester = bool Function(String);

extension StringExtensions on String {
  /// Checks if this [String] contains only numeric characters.
  ///
  /// ```dart
  /// final numeric = '1234'
  /// final nonNumeric = '1234a'
  ///
  /// numeric.isNumeric -> true;
  /// nonNumeric.isNumeric -> false;
  /// ```
  bool get isNumeric => RegExp(r'^-?[0-9]+$').hasMatch(this);

  /// Logical inverse of [String.isNumeric]
  bool get isNonNumeric => !isNumeric;

  /// Applies a RegEx to remove all empty spaces from this [String].
  String get withNoEmptySpaces => replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// ```dart
  /// final helloWorld = 'hello world'.capitalize; -> 'Hello world'
  /// ```
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  /// This drops the first word of a sentence.
  ///
  /// ```dart
  /// 'Hey I am a sentence' -> 'I am a sentence',
  /// ```
  String get dropFirstWord => replaceAll(RegExp(r'^\w+'), '').trim();

  /// This returns the first word of a sentence.
  ///
  /// ```dart
  /// 'Hey I am a sentence' -> 'Hey',
  /// ```
  String? get firstWord => RegExp(r'^\w+').stringMatch(this);
}
