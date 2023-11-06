import 'package:flutter/material.dart';



class AppTheme {
  static ThemeData mainTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
      ));
}
class AppColors {
  static const primaryColor = Color(0xff004182);
  static const darkPrimaryColor = Color(0xff004182);
  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xFF000000);
  static Color greyColor = Color(0xff808080);


}