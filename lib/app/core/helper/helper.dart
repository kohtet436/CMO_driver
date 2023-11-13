import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../values/color_manager.dart';
import '../values/font_manager.dart';

class Helper {
  static bool showLog = true;

  static console(String message) {
    debugPrint(message);
  }

  static void showQuickToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: FontSize.s18,
    );
  }

  static void showLongToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      fontSize: FontSize.s20,
    );
  }

  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.black,
      colorText: ColorManager.white,
    );
  }
}
