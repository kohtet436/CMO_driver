import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromHex('#F5F5F5');
  static Color primaryDarkColor = HexColor.fromHex('#E0E0E0');
  static Color primaryLightColor = HexColor.fromHex('#FAFAFA');
  static Color secondaryColor = HexColor.fromHex('#592C8A');
  static Color secondaryDarkColor = HexColor.fromHex('#3d2378');
  static Color secondaryLightColor = HexColor.fromHex('#9853b2');
  static Color textOnPrimary = HexColor.fromHex('#000000');
  static Color textColorVariant = HexColor.fromHex('#A2A2A2');
  static Color cardColor = HexColor.fromHex('#A27CCB').withOpacity(0.09);
  static Color choiceChipColor = HexColor.fromHex('#A27CCB').withOpacity(0.5);
  //static Color cardColor = Color(0x33592C8A);
  static Color textFieldGrey = HexColor.fromHex('#d9d9d9');
  static Color darkGrey = HexColor.fromHex("#584E4F");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000"); // black color

  static Color lateStatus = HexColor.fromHex("#FFCC00");
  static Color leaveStatus = HexColor.fromHex("#B57600");
  static Color presentStatus = HexColor.fromHex("#00BD09");
  static Color absentStatus = HexColor.fromHex("#C90000");
  static Color comingStatus = grey;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(
      int.parse(hexColorString, radix: 16),
    );
  }
}
