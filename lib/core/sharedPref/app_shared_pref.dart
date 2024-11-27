import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static final AppSharedPreferences _instance =
      AppSharedPreferences._internal();
  static SharedPreferences? _prefs;

  factory AppSharedPreferences() {
    return _instance;
  }

  AppSharedPreferences._internal();

  static const String _keyThemeMode = 'themeMode';

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs?.setString(_keyThemeMode, themeMode.toString());
  }

  Future<ThemeMode> getThemeMode() async {
    _prefs ??= await SharedPreferences.getInstance();
    String? themeModeString = _prefs?.getString(_keyThemeMode);
    if (themeModeString != null) {
      return ThemeMode.values.firstWhere(
          (e) => e.toString() == themeModeString,
          orElse: () => ThemeMode.dark);
    }
    return ThemeMode.dark;
  }
}
