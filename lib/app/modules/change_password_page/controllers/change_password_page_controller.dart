import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPageController extends GetxController {
  final FocusNode currentPasswordFocusNode = FocusNode();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode newPasswordAgainFocusNode = FocusNode();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordAgainController = TextEditingController();

  final isNewPasswordTextFieldFocus = false.obs;
  final isNewPasswordAgainTextFieldFocus = false.obs;

  final isCharacterCountValid = false.obs;
  final isOneSmallLeterValid = false.obs;
  final isOneCapitalLeterValid = false.obs;
  final isOneNumberLeterValid = false.obs;
  final isOneSpecialLeterValid = false.obs;
  final isPasswordsMatch = false.obs;
  final isCurrentPasswordEmpty = true.obs;

  @override
  void onInit() {
    newPasswordFocusNode.addListener(() {
      isNewPasswordTextFieldFocus(!isNewPasswordTextFieldFocus.value);
    });

    newPasswordAgainFocusNode.addListener(() {
      isNewPasswordAgainTextFieldFocus(!isNewPasswordAgainTextFieldFocus.value);
    });

    newPasswordController.addListener(() {
      if (newPasswordController.text.length >= 8) {
        isCharacterCountValid(true);
      } else {
        isCharacterCountValid(false);
      }

      if (newPasswordController.text.contains(RegExp(r'[a-z]'))) {
        isOneSmallLeterValid(true);
      } else {
        isOneSmallLeterValid(false);
      }

      if (newPasswordController.text.contains(RegExp(r'[A-Z]'))) {
        isOneCapitalLeterValid(true);
      } else {
        isOneCapitalLeterValid(false);
      }

      if (newPasswordController.text.contains(RegExp(r'\d'))) {
        isOneNumberLeterValid(true);
      } else {
        isOneNumberLeterValid(false);
      }

      if (newPasswordController.text.contains(RegExp(r'[^\w\s]'))) {
        isOneSpecialLeterValid(true);
      } else {
        isOneSpecialLeterValid(false);
      }
    });

    newPasswordAgainController.addListener(() {
      if (newPasswordController.text == newPasswordAgainController.text &&
          newPasswordAgainController.text.isNotEmpty) {
        isPasswordsMatch(true);
      } else {
        isPasswordsMatch(false);
      }
    });

    currentPasswordController.addListener(() {
      if (currentPasswordController.text.isNotEmpty) {
        isCurrentPasswordEmpty(false);
      } else {
        isCurrentPasswordEmpty(true);
      }
    });

    super.onInit();
  }

  bool isValid() {
    return isCharacterCountValid.value &&
        isOneSmallLeterValid.value &&
        isOneCapitalLeterValid.value &&
        isOneNumberLeterValid.value &&
        isOneSpecialLeterValid.value &&
        isPasswordsMatch.value &&
        !isCurrentPasswordEmpty.value;
  }
}
