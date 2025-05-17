import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // 🟢 Set Light Mode
  void setLightMode() {
    themeMode.value = ThemeMode.light;
  }

  // 🟢 Set Dark Mode
  void setDarkMode() {
    themeMode.value = ThemeMode.dark;
  }

  // 🟢 Toggle between Dark and Light Mode
  void toggleTheme(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode => themeMode.value == ThemeMode.dark;
}
