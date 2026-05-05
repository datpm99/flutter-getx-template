import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static const String fontFamily = 'Roboto';

  /// --- Light Theme ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      surface: Colors.white, // Nền của các card, dialog
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white, // Màu text/icon trên AppBar
      elevation: 0,
    ),
    // ... các cấu hình khác
  );

  /// --- Dark Theme ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      // Flutter sẽ tự tính các màu surface tối cho bạn
    ),
    scaffoldBackgroundColor: AppColors.black2, // Sửa lỗi nền trắng ở dark mode
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black1,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
