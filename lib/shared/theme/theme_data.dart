import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData materialTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primarySwatch: AppColors.deepPurpleSwatch,
        textTheme: CustomTextTheme.textTheme,
        primaryColor: AppColors.deepPurpleSwatch.shade600,
        primaryColorLight: AppColors.deepPurpleSwatch.shade500,
        primaryColorDark: AppColors.deepPurpleSwatch.shade700,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.deepPurpleSwatch.shade400),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepPurpleSwatch.shade400),
          ),
        ));
  }
}
