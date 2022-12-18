import '../constants.dart';
import 'package:vibration/vibration.dart';

// https://stackoverflow.com/questions/16688054/dart-named-parameters-using-a-map
Map<Symbol, dynamic> symbolizeKeys(Map<String, dynamic> map){
  return map.map((k, v) => MapEntry(Symbol(k), v));
}


void vibrateDefault() {
  Vibration.vibrate(duration: defaultVibrationDuration);
}

