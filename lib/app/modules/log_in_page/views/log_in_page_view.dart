import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/assets_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/log_in_page_controller.dart';

class LogInPageView extends StatelessWidget {
  final LogInPageController controller = Get.put(LogInPageController());

  LogInPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode textSecondFocusNode = FocusNode();
    return Obx(
      () => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: ColorManager.secondaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.r30),
                  bottomRight: Radius.circular(AppRadius.r30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'AppLogo',
                    child: Image.asset(
                      ImageAssets.splashLogo,
                      height: 200,
                      width: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: WidgetUtil.defaultHorizontalPadding(),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const CustomText(
                        text: AppStrings.greetings,
                        style: TextStyle(
                          fontSize: FontSize.s30,
                        ),
                      ),
                      WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                      _buildTextField(
                        hintText: AppStrings.logInId,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(8),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        validator: (input) {
                          if (input != null &&
                              input.isNotEmpty &&
                              input.length >= 8) {
                            return null;
                          } else {
                            return AppStrings.driverIdErrorText.tr;
                          }
                        },
                        prefixIcon: Icon(
                          Icons.person,
                          color: ColorManager.lightGrey,
                        ),
                        controller: controller.userIdTextController.value,
                        onSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                      _buildTextField(
                        focusNode: textSecondFocusNode,
                        hintText: AppStrings.logInPassword,
                        obscureText: true,
                        validator: (input) {
                          if (input != null &&
                              input.isNotEmpty &&
                              input.length >= 8) {
                            return null;
                          } else {
                            return AppStrings.passwordErrorText.tr;
                          }
                        },
                        prefixIcon: Icon(
                          Icons.lock,
                          color: ColorManager.lightGrey,
                        ),
                        controller: controller.passwordTextController.value,
                        // onSubmitted: (String value) => handleLogIn(),
                        onSubmitted: (String value) {},
                      ),
                      WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.defaultPadding),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.secondaryColor,
                            padding: WidgetUtil.defaultAllPadding(),
                          ),
                          onPressed: () {
                            if (controller
                                    .userIdTextController.value.text.isEmpty ||
                                controller.passwordTextController.value.text
                                    .isEmpty) {
                              Helper.showQuickToast(
                                  AppStrings.dataBlankErrorText.tr);
                            } else {
                              // } else if (controller
                              //             .userIdTextController.value.text ==
                              //         '00001234' &&
                              //     controller.passwordTextController.value.text ==
                              //         'ABCDabcd1234!@#\$') {
                              //   controller.logIn(
                              //     controller.userIdTextController.value.text,
                              //     controller.passwordTextController.value.text,
                              //   );
                              // if (controller.isLoading.value) {
                              //   showDialog(
                              //     context: context,
                              //     barrierDismissible: false,
                              //     builder: (_) {
                              //       return Center(
                              //           child: Container(
                              //         width: 100.0,
                              //         height: 100.0,
                              //         decoration: const ShapeDecoration(
                              //           color: Colors.white,
                              //           shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.all(
                              //               Radius.circular(10.0),
                              //             ),
                              //           ),
                              //         ),
                              //         child: Center(
                              //           child: CircularProgressIndicator(
                              //             valueColor:
                              //                 AlwaysStoppedAnimation<Color>(
                              //                     ColorManager.secondaryColor),
                              //           ),
                              //         ),
                              //       ));
                              //     },
                              //   );
                              // Get.dialog(
                              //   Dialog(
                              //     child: Container(
                              //       width: 100.0,
                              //       color: ColorManager.white,
                              //       height: 100.0,
                              //       child: Center(
                              //         child: CircularProgressIndicator(
                              //           valueColor: AlwaysStoppedAnimation<Color>(
                              //             ColorManager.secondaryColor
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );
                              // }

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  return Center(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorManager.secondaryColor),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                              Future.delayed(
                                const Duration(
                                  seconds: 1,
                                ),
                                () {
                                  if (controller.userIdTextController.value
                                              .text ==
                                          '00001234' &&
                                      controller.passwordTextController.value
                                              .text ==
                                          'ABab12!@') {
                                    // controller.logIn(
                                    //   controller
                                    //       .userIdTextController.value.text,
                                    //   controller
                                    //       .passwordTextController.value.text,
                                    // );
                                    Get.offAllNamed(Routes.NAVIGATION_PAGE);
                                  } else {
                                    Helper.showQuickToast(
                                      AppStrings.dataWrongErrorText.tr,
                                    );
                                    Get.back();
                                  }
                                },
                              );
                            }
                          },
                          child: const CustomText(
                            text: AppStrings.logIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _handleLogIn(BuildContext context) {
  //   if (controller.userIdTextController.value.text.isEmpty &&
  //       controller.passwordTextController.value.text.isEmpty) {
  //     Helper.showQuickToast("Please enter valid input");
  //   } else {
  //     controller.logIn(
  //       controller.userIdTextController.value.text,
  //       controller.passwordTextController.value.text,
  //     );
  //     if (controller.isLoading.value) {
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (_) {
  //           return Center(
  //               child: Container(
  //             width: 100.0,
  //             height: 100.0,
  //             decoration: const ShapeDecoration(
  //               color: Colors.white,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(
  //                   Radius.circular(10.0),
  //                 ),
  //               ),
  //             ),
  //             child: Center(
  //               child: CircularProgressIndicator(
  //                 valueColor: AlwaysStoppedAnimation<Color>(
  //                     ColorManager.secondaryColor),
  //               ),
  //             ),
  //           ));
  //         },
  //       );
  //     }
  //   }
  // }

  Widget _buildTextField({
    required String hintText,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    int? maxLength,
    bool? obscureText,
    FocusNode? focusNode,
    String? Function(String?)? validator,
    Icon? prefixIcon,
    required TextEditingController controller,
    required void Function(String)? onSubmitted,
  }) {
    return TextFormField(
      style: getRegularStyle(color: ColorManager.black),
      focusNode: focusNode,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.textFieldGrey,
        counterText: '',
        prefixIcon: prefixIcon,
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
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      maxLength: maxLength,
      cursorColor: ColorManager.secondaryColor,
      controller: controller,
      onFieldSubmitted: (String value) {
        return onSubmitted!(value);
      },
    );
  }
}
