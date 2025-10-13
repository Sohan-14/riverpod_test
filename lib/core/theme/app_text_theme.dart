import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/sizes.dart';

class AppTextTheme {
  AppTextTheme._();
  static const TextTheme lightTextTheme = TextTheme(
    // display text theme
    // displayLarge: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.bold, color: AppColors.black),
    displaySmall: TextStyle(
      fontSize: AppSizes.fontSizeL,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),

    // headline text theme
    headlineLarge: TextStyle(
      fontSize: AppSizes.fontSizeH1,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: AppSizes.fontSizeH2,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    // headlineSmall: TextStyle(fontSize: AppSizes.fontSizeH3, fontWeight: FontWeight.w500, color: AppColors.black),

    // body text theme
    bodyLarge: TextStyle(
      fontSize: AppSizes.fontSizeBodyL,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSizes.fontSizeBodyM,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: AppSizes.fontSizeBodyS,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),

    // label text theme
    // labelLarge: TextStyle(fontSize: AppSizes.fontSizeBtn, fontWeight: FontWeight.w500, color: AppColors.black),
  );

  static const TextTheme darkTextTheme = TextTheme(
    // display text theme
    // displayLarge: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.bold, color: AppColors.black),
    displaySmall: TextStyle(
      fontSize: AppSizes.fontSizeL,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),

    // headline text theme
    headlineLarge: TextStyle(
      fontSize: AppSizes.fontSizeH1,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: AppSizes.fontSizeH2,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    // headlineSmall: TextStyle(fontSize: AppSizes.fontSizeH3, fontWeight: FontWeight.w500, color: AppColors.black),

    // body text theme
    bodyLarge: TextStyle(
      fontSize: AppSizes.fontSizeBodyL,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSizes.fontSizeBodyM,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: AppSizes.fontSizeBodyS,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),

    // label text theme
    // labelLarge: TextStyle(fontSize: AppSizes.fontSizeBtn, fontWeight: FontWeight.w500, color: AppColors.black),
  );
}
