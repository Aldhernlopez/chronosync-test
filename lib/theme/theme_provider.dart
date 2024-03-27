import 'package:chronosync/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  // Initially Light Mode
  ThemeData _themeData = lightMode;

  // Accessing Current Theme
  ThemeData get themeData => _themeData;

  // Checking Whether Dark Mode or Not
  bool get isDarkMode => themeData == darkMode;

  // Setting the Theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  // Toggle Between Theme Modes
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}