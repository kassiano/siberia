<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Siberia lib is a lib for useful extentions to dart language. 

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

### String Extentions
* `orEmpty`:

```dart
final String? value;
print(value.orEmpty());
```

* `toInt`:
```dart
final String value = "10";
final int intValue = value.toInt();
```

* `toIntOrNull`:
```dart
final String value = "X10";
final int? intNullableValue = value.toIntOrNull();
```

* `toDouble`:
```dart
final String value = "10";
final double doubleValue = value.toDouble();
```

* `toDoubleOrNull`:
```dart
final String value = "X10";
final double? doubleNullableValue = value.toDoubleOrNull();
```

## Additional information

