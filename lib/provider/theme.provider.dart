

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentTheme;

  ThemeProvider({
    required bool isDarkMode,
  }): currentTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  setLightMode() {
    currentTheme = ThemeMode.light;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeMode.dark;
    notifyListeners();
  }
}