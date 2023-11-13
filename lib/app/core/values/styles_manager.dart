import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constant.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String engFontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: engFontFamily,
      fontWeight: fontWeight,
      color: color);
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.defaultEngFontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize,
      Get.locale == ENG_LOCALE
          ? FontConstants.engFontFamily
          : FontConstants.mmFontFamily,
      FontWeightManager.regular,
      color);
}

TextStyle getTextStyle() {
  return TextStyle(
    fontFamily: Get.locale == ENG_LOCALE
        ? FontConstants.engFontFamily
        : FontConstants.mmFontFamily,
    fontSize: Get.locale == ENG_LOCALE
        ? FontSize.defaultEngFontSize
        : FontSize.defaultMmFontSize,
  );
}

TextStyle getMmRegularStyle({
  double fontSize = FontSize.defaultMmFontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize, FontConstants.mmFontFamily, FontWeightManager.regular, color);
}

TextStyle getEngTextStyle({
  double fontSize = FontSize.defaultEngFontSize,
  required Color color,
  required bool isBold,
  required TextStyle textStyle,
}) {
  return textStyle.copyWith(
    fontSize: fontSize,
    color: color,
    fontFamily: FontConstants.engFontFamily,
    fontWeight: isBold ? FontWeightManager.bold : FontWeightManager.regular,
  );
}

TextStyle getMmTextStyle({
  double fontSize = FontSize.defaultMmFontSize,
  required Color color,
  required bool isBold,
  required TextStyle textStyle,
}) {
  return textStyle.copyWith(
    fontSize: fontSize,
    color: color,
    fontFamily: FontConstants.mmFontFamily,
    fontWeight: isBold ? FontWeightManager.bold : FontWeightManager.regular,
  );
}

TextStyle getDrawerStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.regular, color);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.defaultEngFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.light, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.defaultEngFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.medium, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.defaultEngFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.semiBold, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.defaultEngFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.bold, color);
}

TextStyle getEngBoldStyle(
    {double fontSize = FontSize.defaultEngFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.engFontFamily, FontWeightManager.bold, color);
}

TextStyle getMmBoldStyle(
    {double fontSize = FontSize.defaultMmFontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.mmFontFamily, FontWeightManager.bold, color);
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s10),
    ),
  ),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: ColorManager.white,
  backgroundColor: ColorManager.secondaryColor,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s10),
    ),
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.red,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s10),
    ),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(
          color: ColorManager.primaryLightColor,
          width: 1,
        );
      }
      return BorderSide(
        color: ColorManager.primaryColor,
        width: 1,
      ); // Defer to the widget's default.
    },
  ),
);
