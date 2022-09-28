import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mode with ChangeNotifier {
  bool darkMode = false;
  Future<void> changeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkMode = !darkMode;
    if (sharedPreferences.getBool("darkMode") == null) {
      sharedPreferences.setBool("darkMode", darkMode);
      print("Hello");
      print(sharedPreferences.getBool("darkMode"));
    } else {
      sharedPreferences.setBool(
          "darkMode", !sharedPreferences.getBool("darkMode")!);
      print("Hi");
      print(sharedPreferences.getBool("darkMode"));
    }
    notifyListeners();
  }

  void setMode(value) {
    darkMode = value;
  }
}
