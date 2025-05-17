import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String languageKey = 'selectedLanguage';
  static const String themeKey = 'isDarkTheme';
  static const String onboardingKey = 'onboarding_completed'; // استخدام هذا المفتاح فقط
  static const String startOnboardingKey = 'isStartOnboardingShown';

  // Save language
  static Future<void> setLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, langCode);
  }

  // Get saved language
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey) ?? 'en';
  }

  // Save theme mode
  static Future<void> setTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDark);
  }

  // Get saved theme mode
  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey) ?? false;
  }

  // Save onboarding completion status
  static Future<void> setOnboardingCompleted(bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, isCompleted);
  }

  // Get onboarding completion status
  static Future<bool> getOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }

  // Save Start Onboarding status
  static Future<void> setStartOnboardingShown(bool isShown) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(startOnboardingKey, isShown);
  }

  // Get Start Onboarding status
  static Future<bool> getStartOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(startOnboardingKey) ?? false;
  }
}
