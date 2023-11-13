import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/color_manager.dart';
import '../values/styles_manager.dart';
import '../values/values_manager.dart';

class ProfileTextField extends StatelessWidget {
  final bool enabled;
  final String hintText;
  final String preFilledText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const ProfileTextField({
    super.key,
    this.enabled = false,
    this.hintText = '',
    required this.preFilledText,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: TextEditingController(
        text: preFilledText,
      ),
      autovalidateMode: autovalidateMode,
      style: getTextStyle().copyWith(
        color: ColorManager.textOnPrimary,
      ),
      decoration: InputDecoration(
        focusColor: ColorManager.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textOnPrimary,
            width: AppSize.defaultStrokeWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppPadding.defaultPadding,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textFieldGrey,
            width: AppSize.defaultStrokeWidth,
          ),
          borderRadius: BorderRadius.circular(
            AppRadius.defaultRadius,
          ),
        ),
        enabled: enabled,
        hintText: hintText.tr,
        hintStyle: getTextStyle().copyWith(
          color: ColorManager.textOnPrimary,
        ),
      ),
      validator: validator,
    );
  }
}
