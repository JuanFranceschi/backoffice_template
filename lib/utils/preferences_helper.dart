import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyDarkMode = 'darkMode';

  SharedPreferencesHelper._privateConstructor();

  static final SharedPreferencesHelper instance =
      SharedPreferencesHelper._privateConstructor();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> getDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(_keyDarkMode) ?? false;
  }

  Future<void> setDarkMode(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(_keyDarkMode, value);
  }
}
