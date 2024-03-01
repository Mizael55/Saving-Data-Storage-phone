import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  // Obtain shared preferences.
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    _name = _prefs.getString('name') ?? '';
    return _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    _isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    return _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool('isDarkMode', isDarkMode);
  }

  static int get genero {
    _genero = _prefs.getInt('genero') ?? 1;
    return _genero;
  }

  static set genero(int genero) {
    _genero = genero;
    _prefs.setInt('genero', genero);
  }
}
