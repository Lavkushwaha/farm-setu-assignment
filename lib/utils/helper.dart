//convert farenheit to celcius

import 'package:intl/intl.dart';

farenheitToCelcius(farenheit) {
  return (farenheit - 32) * 5 / 9;
}

String parseTimeStamp(int value) {
  var dt = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var d12 = DateFormat('dd MMM').format(dt);
  return d12;
}

int parseTimeStampToLinux(DateTime dt) {
  return dt.millisecondsSinceEpoch ~/ 1000;

  // var dt = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  // var d12 = DateFormat('dd MMM').format(dt);
  // return d12;
}
