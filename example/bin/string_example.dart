import 'package:siberia/siberia.dart';

void main(List<String> arguments) {
  String? exampleString;

  //orEmpty example
  exampleString = null;
  print(exampleString.orEmpty);

  //toInt example
  exampleString = "1";
  int intValue = exampleString.toInt();
  print(intValue);

  //toIntOrNull example
  exampleString = "value";
  int? intNullValue = exampleString.tryToInt();
  print(intNullValue);

  //toDouble example
  exampleString = "1";
  double doubleValue = exampleString.toDouble();
  print(doubleValue);

  //toDoubleOrNull example
  exampleString = "1";
  double? doubleNullValue = exampleString.tryToDouble();
  print(doubleNullValue);
}
