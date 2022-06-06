import 'package:flutter/material.dart';

abstract class AppColors {
  static MaterialColor deepPurpleSwatch =
      const MaterialColor(0xFF5232AB, <int, Color>{
    50: Color(0xffa08ed1),
    100: Color(0xff9784cd),
    200: Color(0xff8670c4),
    300: Color(0xff755bbc),
    400: Color(0xff6346b3),
    500: Color(0xff5232ab),
    600: Color(0xff4a2d9a),
    700: Color(0xff422889),
    800: Color(0xff392378),
    900: Color(0xff311e67),
  });

  static const Color deepPink = Color(0xFFFF5B7E);
  static const Color deepPinkDark = Color(0xFFE43E6E);

  static const Color deepGreen = Color(0xFF02CCC0);

  static const Color deepBlue = Color(0xFF3C98F2);
  static const Color deepBlueLight = Color(0xFF61B1FF);

  static const Color deepPurple = Color(0xFF5232AB);
  static const Color deepPurpleLight = Color(0xFFAF9AFF);

  static const Color feedbackColorHelperPure = Color(0xFFFEB546);
  static const Color feedbackColorHelperLight = Color(0xFFF6BE35);
  static const Color feedbackColorHelperDark = Color(0xFFFF8A00);
  static const Color cancelReasonColor = Color(0xFFF3EEE8);

  static const Color neutralColorLowPure = Color(0xFF000000);
  static const Color neutralColorLowLight = Color(0xFFA3A3A3);
  static const Color neutralColorLowMedium = Color(0xFF666666);
  static const Color neutralColorLowDark = Color(0xFF292929);
  static const Color neutralColorHightPure = Color(0xFFFFFFFF);
  static const Color neutralColorHightLight = Color(0xFFF5F5F5);
  static const Color neutralColorHightMedium = Color(0xFFE0E0E0);
  static const Color neutralColorHightDark = Color(0xFFCCCCCC);
}
