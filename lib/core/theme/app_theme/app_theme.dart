import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.accentYellow,
      onPrimary: AppColors.white,
      secondary: AppColors.gray,
      onSecondary: AppColors.primaryDark,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.primaryDark ,
      onSurface: AppColors.white,
    ),
  );
}
