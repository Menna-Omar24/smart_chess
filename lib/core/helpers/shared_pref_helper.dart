import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String startOnboardingKey = 'start_onboarding_seen';
  static const String onboardingSlidesKey = 'onboarding_slides_seen';

  // Start Onboarding (first screen with language & theme switches)
  static Future<bool> hasSeenStartOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(startOnboardingKey) ?? false;
  }

  static Future<void> setStartOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(startOnboardingKey, true);
  }

  // Actual onboarding slides (Walkthrough)
  static Future<bool> hasSeenOnboardingSlides() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingSlidesKey) ?? false;
  }

  static Future<void> setOnboardingSlidesSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingSlidesKey, true);
  }
}
