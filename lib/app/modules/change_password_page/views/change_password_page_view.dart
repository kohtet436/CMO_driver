import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/password_text_form_field.dart';
import '../controllers/change_password_page_controller.dart';

class ChangePasswordPageView extends GetView<ChangePasswordPageController> {
  const ChangePasswordPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          WidgetUtil.defaultAppBar(title: AppStrings.changePasswordAppBar.tr),
      body: Padding(
        padding: WidgetUtil.defaultAllPadding(),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  WidgetUtil.spaceVertical(AppSize.s16),
                  const CustomText(
                    text: AppStrings.currentPassword,
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  WidgetUtil.spaceVertical(AppSize.s16),
                  PasswordTextFormField(
                    isHide: true,
                    controller: controller.currentPasswordController,
                    focusNode: controller.currentPasswordFocusNode,
                    onEditingComplete:
                        controller.newPasswordFocusNode.requestFocus,
                    hintText: AppStrings.currentPasswordHint,
                  ),
                  WidgetUtil.spaceVertical(AppSize.s16),
                  const CustomText(
                    text: AppStrings.newPassword,
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  WidgetUtil.spaceVertical(AppSize.s16),
                  PasswordTextFormField(
                    isHide: false,
                    controller: controller.newPasswordController,
                    focusNode: controller.newPasswordFocusNode,
                    hintText: AppStrings.newPasswordHint,
                    onEditingComplete:
                        controller.newPasswordAgainFocusNode.requestFocus,
                  ),
                  Obx(
                    () => controller.isNewPasswordTextFieldFocus.value
                        ? Padding(
                            padding: WidgetUtil.defaultAllPadding()
                                .copyWith(bottom: 0),
                            child: Column(
                              children: [
                                WidgetUtil.defaultValidatorText(
                                  controller.isCharacterCountValid.value,
                                  AppStrings.minimumCharacterCount,
                                ),
                                WidgetUtil.defaultValidatorText(
                                  controller.isOneSmallLeterValid.value,
                                  AppStrings.oneSmallLetter,
                                ),
                                WidgetUtil.defaultValidatorText(
                                  controller.isOneCapitalLeterValid.value,
                                  AppStrings.oneCapitalLetter,
                                ),
                                WidgetUtil.defaultValidatorText(
                                  controller.isOneNumberLeterValid.value,
                                  AppStrings.oneNumber,
                                ),
                                WidgetUtil.defaultValidatorText(
                                  controller.isOneSpecialLeterValid.value,
                                  AppStrings.oneSpecialLetter,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  WidgetUtil.spaceVertical(AppSize.s16),
                  PasswordTextFormField(
                    isHide: false,
                    controller: controller.newPasswordAgainController,
                    focusNode: controller.newPasswordAgainFocusNode,
                    hintText: AppStrings.newAgainPasswordHint,
                    onEditingComplete: () {},
                  ),
                  Obx(
                    () => controller.isNewPasswordAgainTextFieldFocus.value
                        ? Padding(
                            padding: WidgetUtil.defaultAllPadding(),
                            child: WidgetUtil.defaultValidatorText(
                              controller.isPasswordsMatch.value,
                              AppStrings.isMatch,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: controller.isValid()
                    ? () => Get.dialog(
                          Dialog(
                            child: Padding(
                              padding: WidgetUtil.defaultAllPadding(),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  const CustomText(
                                    text: AppStrings.confirmation,
                                    style: TextStyle(
                                      fontSize: FontSize.s18,
                                      fontWeight: FontWeightManager.bold,
                                    ),
                                  ),
                                  WidgetUtil.spaceVertical(AppPadding.p16),
                                  const CustomText(
                                    text: AppStrings.changePaswordConfirmText,
                                  ),
                                  WidgetUtil.spaceVertical(AppPadding.p16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: raisedButtonStyle.copyWith(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              ColorManager.grey,
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: CustomText(
                                            text: AppStrings.backButton,
                                            style: TextStyle(
                                              color: ColorManager.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      WidgetUtil.spaceHorizontal(
                                          AppPadding.p16),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: CustomText(
                                            text: AppStrings.confirmButton,
                                            style: TextStyle(
                                              color: ColorManager.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    : null,
                child: const CustomText(
                  text: AppStrings.changePasswordButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
