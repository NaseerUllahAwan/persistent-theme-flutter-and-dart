import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStyleModeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  ThemeNotifier() {
    mode = false;
    _loadFromPrefs();
  }

  bool mode = false;

  //0 for light and 1 for dark
  Color primaryBackgroundColor = Colors.white;
  Color appBarBackgroundColor = Colors.cyan;
  Color boxColor = Colors.blue[50];
  Color boxTextColor = Colors.indigo;
  Color primaryTextColor = Colors.white;
  Color dashboardColor = Colors.cyan;
  Color dashboardTextColor = Colors.red[600];
  Color dashboardIconColor = Colors.yellow[200];

  switchMode() {
    if (mode == false) {
      //if it is light mode currently switch to dark
      primaryBackgroundColor = Colors.grey[900];
      appBarBackgroundColor = Colors.grey[800];
      boxColor = Colors.black;
      boxTextColor = Colors.grey[100];
      primaryTextColor = Colors.black;
      dashboardColor = Colors.grey[900];
      dashboardTextColor = Colors.grey[400];
      dashboardIconColor = Colors.white;

      mode = true;
    } else {
      //if it is dark mode currently switch to light
      primaryBackgroundColor = Colors.white;
      appBarBackgroundColor = Colors.cyan[200];
      boxColor = Colors.tealAccent;
      boxTextColor = Colors.indigo;
      primaryTextColor = Colors.white;
      dashboardColor = Colors.cyan;
      dashboardTextColor = Colors.red[600];
      dashboardIconColor = Colors.yellow[200];
      mode = false;
    }
    _saveToPrefs();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  // ThemeNotifier() {
  //   mode = false;
  //   _loadFromPrefs();
  // }

  // toggleTheme() {
  //   mode = !mode;
  //   _saveToPrefs();
  //   notifyListeners();
  // }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    mode = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, mode);
  }
}
