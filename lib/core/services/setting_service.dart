import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/sharedPref/app_shared_pref.dart';

class SettingsService extends GetxService {


  final themeMode = ThemeMode.dark.obs;

  @override
  void onInit() {
    super.onInit();
    () async {
      themeMode.value = await AppSharedPreferences().getThemeMode();
    }();
  }

  Future<void> toggleThemeMode() async {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
    await AppSharedPreferences().setThemeMode(themeMode.value);
  }

  
}
