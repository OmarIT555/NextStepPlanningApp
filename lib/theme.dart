  import 'package:flutter/material.dart';
  // import 'package:shared_preferences/shared_preferences.dart';
  /***
   * The purpose fo this page is to allow user choose between themes.
   */
  class ThemeChanger with ChangeNotifier{
    ThemeData _themeData;
    ThemeChanger(this._themeData);

    getTheme() => _themeData;

    setTheme(ThemeData theme) {
      _themeData = theme;
      notifyListeners();
    }
  }

  int themeNumber;
  ThemeData getTheme(int themeNumber) {
    ThemeData currentTheme;

    if(themeNumber == 0) {
      // Light Theme
      currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.green, primaryColor: Colors.green);
    }

    if(themeNumber == 1) {
      // Dark Theme
      currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.green, primaryColor: Colors.green);
    }

    if(themeNumber == 2) {
      // Dark Theme
      currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.green, primaryColor: Colors.green);
    }

    return currentTheme;
  }
  /*class ThemePrefs{
    String key = "theme";
    SharedPreferences themePrefs;

    void initState() {
      //initSharedPreferences();
    loadPrefs();
    }

    initSharedPreferences() async {
      themePrefs = await SharedPreferences.getInstance();
      loadPrefs();
    }


    loadPrefs() {
    //await initPrefs();
      if (themeNumber != null) {
        themeNumber = themePrefs.getInt(key);
      }
    }

    savePrefs(int themeNumber) {
    //await initPrefs();
    themePrefs.setInt(key, themeNumber);
    }

    int getThemeNumber(){
      int tempNum = 0;
      loadPrefs();
      print("The themeNumber is ");
      print(themeNumber);

      if (themeNumber == null)
      {
        return tempNum;
      }

      else
      {
        tempNum = themeNumber;
        return themeNumber;
      }
    }

  }*/