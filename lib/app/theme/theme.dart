import 'package:animus_mobile_flutter/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme(
      background: AppColors.background,
      primary: AppColors.primary,
      brightness: Brightness.light,
      secondary: AppColors.secondary,
      onBackground: AppColors.onBackground,
      error: AppColors.error,
      onError: AppColors.onError,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      surface: AppColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
    )
  );
}