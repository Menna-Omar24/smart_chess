import 'package:en_passant/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData isLight = ThemeData(
    colorScheme: ColorScheme.light(
        primary: AppColor.primary,
        onPrimary: AppColor.white, // لون الكلام أو الأيقونات فوق اللون الأساسي
        secondary: AppColor.black,
        onSecondary: AppColor.black,
        outline: AppColor.gray),
    scaffoldBackgroundColor: AppColor.onPrimary,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'cairo',
      ),
    ),
    fontFamily: 'cairo',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );

//Dark Mode

  static ThemeData isDark = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Color(0xff5669FF), // اللون الأساسي
        onPrimary:
            AppColor.onPrimary, // لون الكلام أو الأيقونات فوق اللون الأساسي
        secondary: AppColor.secondary,
        onSecondary: AppColor.onPrimary,
        outline: AppColor.onPrimary // لون مساعد (ممكن تستخدمه كـ accent)
        ),
    scaffoldBackgroundColor: AppColor.secondary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.secondary,
      titleTextStyle: TextStyle(
        fontFamily: 'cairo',
      ),
    ),
    fontFamily: 'cairo',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColor.onPrimary,
      ),
    ),
  );
}
