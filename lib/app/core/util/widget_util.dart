import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'method_util.dart';
import '../helper/app_enum.dart';
import '../values/styles_manager.dart';
import '../values/assets_manager.dart';
import '../values/color_manager.dart';
import '../values/font_manager.dart';
import '../values/values_manager.dart';
import '../widget/custom_text_widgets.dart';

class WidgetUtil {
  static WidgetUtil? _instance;

  WidgetUtil._();

  factory WidgetUtil() {
    _instance ??= WidgetUtil._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  static int rotateH() {
    return 1;
  }

  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceHorizontal2(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height);
  }

  static Widget spaceVertical2(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalLine1() {
    return Container(
      color: Colors.black.withOpacity(0.2),
      height: 0.5,
    );
  }

  static Widget verticalLine1() {
    return Container(
      color: Colors.black.withOpacity(0.2),
      width: 0.5,
    );
  }

  static Widget verticalGreyLine1() {
    return Container(
      color: Colors.grey,
      width: 0.5,
    );
  }

  static EdgeInsets defaultHorizontalPadding() {
    return const EdgeInsets.symmetric(horizontal: AppPadding.p16);
  }

  static EdgeInsets defaultVerticalPadding() {
    return const EdgeInsets.symmetric(vertical: AppPadding.p16);
  }

  static EdgeInsets defaultAllPadding() {
    return const EdgeInsets.all(AppPadding.p16);
  }

  static EdgeInsets defaultElevatedButtonPadding() {
    return const EdgeInsets.all(AppPadding.p8);
  }

  static EdgeInsets defaultCardPadding() {
    return const EdgeInsets.all(AppPadding.p16);
  }

  static EdgeInsets ferryStopCardPadding() {
    return const EdgeInsets.all(AppPadding.p20);
  }

  static double vehiclePhotoHeight() {
    return 250;
  }

  static Text labelBurmeseText(String text) {
    return Text(
      text,
      style: labelBurmeseFontStyle,
    );
  }

  static Text normalBurmeseText(String text) {
    return Text(
      text,
      style: normalBurmeseFontStyle,
    );
  }

  static Text labelText(String text, Color color) {
    return Text(
      text,
      style: Get.deviceLocale == const Locale('en', 'US')
          ? getBoldStyle(color: color)
          : getMmBoldStyle(color: color),
    );
  }

  Widget getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppSize.s12,
              offset: Offset(AppSize.s0, AppSize.s12),
            )
          ],
        ),
        child: getDialogContent(
          context,
          [getAnimatedImage(AnimAssets.splashAnim)],
        ),
      ),
    );
  }

  Widget getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  static Widget getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), //json image
    );
  }

  static void actionOpenDialog() {
    Get.dialog(
      Center(
        child: WillPopScope(
          onWillPop: () async => false,
          child: /*Card(
              elevation: 5,
              child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                child:  getAnimatedImage(JsonAssets.loading),
              ),
            )*/
              getAnimatedImage(AnimAssets.splashAnim),
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0x26000000),
    );
  }

  static AppBar defaultAppBar({
    required String title,
    List<Widget>? actions,
  }) {
    return AppBar(
      toolbarHeight: 64,
      centerTitle: true,
      titleTextStyle: getBoldStyle(color: ColorManager.white),
      title: CustomText(text: title),
      backgroundColor: ColorManager.secondaryColor,
      actions: actions ?? <Widget>[],
    );
  }

  static CustomText getEmployeeStatus(EmployeeAttendance employeeAttendance) {
    switch (employeeAttendance) {
      case EmployeeAttendance.PRESENT:
        return CustomText(
          text:
              MethodUtil.employeeAttendanceToString(EmployeeAttendance.PRESENT),
          style: TextStyle(
            color: ColorManager.presentStatus,
          ),
        );
      case EmployeeAttendance.ABSENT:
        return CustomText(
          text:
              MethodUtil.employeeAttendanceToString(EmployeeAttendance.ABSENT),
          style: TextStyle(
            color: ColorManager.absentStatus,
          ),
        );
      case EmployeeAttendance.LEAVE:
        return CustomText(
          text: MethodUtil.employeeAttendanceToString(EmployeeAttendance.LEAVE),
          style: TextStyle(
            color: ColorManager.leaveStatus,
          ),
        );
      case EmployeeAttendance.LATE:
        return CustomText(
          text: MethodUtil.employeeAttendanceToString(EmployeeAttendance.LATE),
          style: TextStyle(
            color: ColorManager.lateStatus,
          ),
        );
      case EmployeeAttendance.COMING:
        return CustomText(
          text:
              MethodUtil.employeeAttendanceToString(EmployeeAttendance.COMING),
          style: TextStyle(
            color: ColorManager.presentStatus,
          ),
        );
    }
  }

  static Widget defaultValidatorText(bool isValid, String text) {
    return Row(
      children: [
        isValid
            ? Icon(
                Icons.check,
                color: ColorManager.secondaryColor,
              )
            : Icon(
                Icons.close,
                color: ColorManager.error,
              ),
        spaceHorizontal(AppSize.s8),
        Expanded(
          child: CustomText(
            text: text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorManager.lightGrey,
              fontSize: FontSize.s16,
            ),
          ),
        ),
      ],
    );
  }

  static ChoiceChip customChoicChip({
    required String label,
    required bool selected,
    required Color color,
    required Function onSelected,
  }) {
    return ChoiceChip(
      label: CustomText(
        text: label,
        style: TextStyle(
          color: selected ? ColorManager.white : ColorManager.black,
        ),
      ),
      selected: selected,
      selectedColor: color,
      elevation: 1,
      backgroundColor: ColorManager.cardColor,
      onSelected: (value) => onSelected(value),
    );
  }
}
