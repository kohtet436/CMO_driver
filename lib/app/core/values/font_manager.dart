import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_manager.dart';
import 'language_manager.dart';

class FontConstants {
  static const String engFontFamily = "NotoSans";
  static const String mmFontFamily = "NotoSansMyanmar";
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s25 = 25.0;
  static const double s30 = 30.0;
  static const double s40 = 40.0;
  static const double s50 = 50.0;
  static const double s70 = 70.0;

  static const double defaultEngFontSize = s16;
  static const double defaultMmFontSize = s14;
}

// App Bar Font Style (Burmese)
TextStyle appBarBurmeseFontStyle = TextStyle(
  fontFamily: FontConstants.mmFontFamily,
  fontWeight: FontWeightManager.bold,
  fontSize: FontSize.s20,
  color: ColorManager.primaryColor,
);

// Label Font Style (Burmese)
const labelBurmeseFontStyle = TextStyle(
  fontFamily: FontConstants.mmFontFamily,
  fontWeight: FontWeightManager.bold,
  fontSize: FontSize.s18,
);

// Normal Font Style (Burmese)
const normalBurmeseFontStyle = TextStyle(
  fontFamily: FontConstants.mmFontFamily,
  fontSize: FontSize.s16,
);

class LanguageChangeFontSize {
  static double s10 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s10
          : FontSize.s8;
  static double s12 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s12
          : FontSize.s10;
  static double s14 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s14
          : FontSize.s12;
  static double s16 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s16
          : FontSize.s14;
  static double s18 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s18
          : FontSize.s16;
  static double s20 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s20
          : FontSize.s18;
  static double s25 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s25
          : FontSize.s20;
  static double s30 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s30
          : FontSize.s25;
  static double s40 =
      Get.locale!.languageCode == LanguageType.ENGLISH.getValue()
          ? FontSize.s40
          : FontSize.s30;
}
