import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constant.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main Colors of the app
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.primaryLightColor,
    primaryColorDark: ColorManager.primaryDarkColor,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.primaryLightColor,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.cardColor,
      shadowColor: Colors.transparent,
      elevation: AppSize.s4,
    ),
    //AppBarTheme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryLightColor,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primaryColor,
      splashColor: ColorManager.primaryLightColor,
    ),
    // elevated button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(color: ColorManager.white),
    //         primary: ColorManager.primary,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),
    textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
    elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    // Text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s20,
      ),
      displayMedium: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s20,
      ),
      displaySmall: getBoldStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s20,
      ),
      headlineMedium: getRegularStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s16,
      ),
      headlineSmall: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s20,
      ),
      // bold number text keyboard
      titleLarge: getBoldStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s16,
      ),
      // bold text with primary color
      titleMedium: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s16,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      // medium button text white
      bodyLarge: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s20,
      ),
      //regular error black text label
      bodyMedium: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s20,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
    ),

    /*
       textTheme: TextTheme(
          headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize:_sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16),
          headline2: getRegularStyle(color: ColorManager.white, fontSize:_sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16),
          headline3: getBoldStyle(color: ColorManager.primary, fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16),
          headline4: getRegularStyle(color: ColorManager.primary, fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s16:FontSize.s14),
          headline5: getBoldStyle(color: ColorManager.white,fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16), // bold number text keyboard
          headline6: getBoldStyle(color: ColorManager.primary,fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s16:FontSize.s14), // bold text with primary color
          subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s16:FontSize.s14),
          subtitle2: getMediumStyle(color: ColorManager.white, fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s16:FontSize.s14), // medium button text white
          caption:   getRegularStyle(color: ColorManager.darkGrey,fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s16:FontSize.s14), // crate text fontsize 16 color darkGrey
          bodyText1: getRegularStyle(color: ColorManager.black,fontSize: _sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16),//regular error black text label
          bodyText2: getBoldStyle(color:ColorManager.black,fontSize:_sharedPref.getAppLanguage() == LanguageType.ENGLISH.getValue()? FontSize.s20:FontSize.s16)
      ),
       */
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: Get.locale == ENG_LOCALE
          ? getRegularStyle(
              color: ColorManager.darkGrey,
              fontSize: FontSize.defaultEngFontSize)
          : getRegularStyle(
              color: ColorManager.darkGrey,
              fontSize: FontSize.defaultMmFontSize),

      // label style
      labelStyle:
          getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s20),

      // error style
      errorStyle:
          getRegularStyle(color: ColorManager.error, fontSize: FontSize.s12),

      //enable border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      floatingLabelStyle:
          getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorManager.grey)
        .copyWith(secondary: ColorManager.secondaryColor),
  );
}
