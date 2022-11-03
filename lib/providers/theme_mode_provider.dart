import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mode with ChangeNotifier {
  bool darkMode = false;
  Future<void> changeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkMode = !darkMode;
    if (sharedPreferences.getBool("darkMode") == null) {
      sharedPreferences.setBool("darkMode", darkMode);
    } else {
      sharedPreferences.setBool(
          "darkMode", !sharedPreferences.getBool("darkMode")!);
    }
    notifyListeners();
  }
}
