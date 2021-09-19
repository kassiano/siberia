import 'package:siberia/siberia.dart';

void main(List<String> arguments) {

  String? exempleString;

  //orEmprty exemple
  exempleString = null;
  print(exempleString.orEmpty());

  //toInt exemple
  exempleString = "1";
  int intValue = exempleString.toInt();
  print(intValue);

  //toIntOrNull exemple
  exempleString = "value";
  int? intNullValue = exempleString.toIntOrNull();
  print(intNullValue);

  //toDouble exemple
  exempleString = "1";
  double doubleValue = exempleString.toDouble();
  print(doubleValue);

  //toDoubleOrNull exemple
  exempleString = "1";
  double? doubleNullValue = exempleString.toDoubleOrNull();
  print(doubleValue);

}
