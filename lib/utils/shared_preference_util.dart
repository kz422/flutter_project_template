import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static SharedPreferenceUtil? _instance;
  late SharedPreferences _pref;
  factory SharedPreferenceUtil() => _instance ??= SharedPreferenceUtil._();
  SharedPreferenceUtil._();

  String get email => _pref.getString('email') ?? '';
  set email(String value) => _pref.setString('email', value);

  List<String> get words => _pref.getStringList('words') ?? [];
  set words(List<String> value) => _pref.setStringList('words', value);

  void removeAll() {}

  // main_xxx.dartからのみ呼び出す
  void setPref(SharedPreferences pref) {
    _pref = pref;
  }
}
