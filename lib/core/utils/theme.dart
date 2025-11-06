import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/app_fonts.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.cairoFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: AppFonts.cairoFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ),
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.darkColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    dividerTheme: DividerThemeData(color: AppColors.accentColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.accentColor,
      filled: true,
      prefixIconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
      hintStyle: TextStyles.body.copyWith(color: AppColors.greyColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}