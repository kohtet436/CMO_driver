import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/color_manager.dart';
import '../values/styles_manager.dart';
import '../values/values_manager.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onEditingComplete,
    required this.hintText,
    required this.isHide,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onEditingComplete;
  final String hintText;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.cardColor,
        counterText: '',
        focusColor: ColorManager.secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textFieldGrey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textFieldGrey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            AppRadius.defaultRadius,
          ),
        ),
        hintText: hintText.tr,
        hintStyle: getRegularStyle(
          color: ColorManager.lightGrey,
        ),
      ),
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: () {
        onEditingComplete();
      },
    );
  }
}
