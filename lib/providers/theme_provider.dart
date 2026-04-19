import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightAccent,
      surface: Colors.white,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
      bodyMedium: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkAccent,
      surface: AppColors.darkPrimary,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    ),
  );

  ThemeData getTheme(BuildContext context) {
    switch (_themeMode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }
}