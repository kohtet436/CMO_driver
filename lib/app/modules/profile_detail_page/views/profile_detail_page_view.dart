import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';

import '../../../core/helper/constant.dart';
import '../../../data/model/driver_update_profile.dart';
import '../../../core/values/assets_manager.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/profile_text_field.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../controllers/profile_detail_page_controller.dart';

class ProfileDetailPageView extends GetView<ProfileDetailPageController> {
  const ProfileDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () {
            if (controller.isEditable.value) {
              if (controller.phoneController.text.trim() == '' ||
                  !controller.phoneController.text.startsWith('09') ||
                  controller.phoneController.text.length < 9) {
                controller.phonefocusNode.value.requestFocus();
              } else if (controller.addressController.text.trim() == '' ||
                  controller.addressController.text.length < 4) {
                controller.addressFocusNode.value.requestFocus();
              } else {
                final DriverUpdateProfile driverUpdateProfile =
                    DriverUpdateProfile(
                  id: TEST_ID,
                  phoneNumber: controller.phoneController.text.trim(),
                  address: controller.addressController.text.trim(),
                );
                controller.updateDriverProfile(driverUpdateProfile);
                controller.isEditable(false);
              }
            } else {
              controller.isEditable(true);
            }
          },
          backgroundColor: ColorManager.secondaryColor,
          child: controller.isEditable.value
              ? const Icon(Icons.save)
              : const Icon(Icons.edit),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  controller.getDriverProfile();
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: WidgetUtil.defaultAllPadding(),
                  children: [
                    OctoImage(
                      fit: BoxFit.cover,
                      width: AppSize.defaultProfileImageSize,
                      height: AppSize.defaultProfileImageSize,
                      imageBuilder: OctoImageTransformer.circleAvatar(),
                      image: CachedNetworkImageProvider(
                          controller.driver.value!.photoPath),
                      errorBuilder: (context, error, stackTrace) => const Image(
                        image: AssetImage(ImageAssets.employeePhotoPlaceHolder),
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: controller.driver.value!.name,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.p8),
                    CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "#${controller.driver.value!.vehicleEmployeeNumber}",
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.email,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText: controller.driver.value!.email,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.phone,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    TextFormField(
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      focusNode: controller.phonefocusNode.value,
                      controller: controller.phoneController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: getTextStyle().copyWith(
                        color: ColorManager.textOnPrimary,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: controller.isEditable.value,
                        focusColor: ColorManager.black,
                        fillColor: ColorManager.cardColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorManager.cardColor,
                            width: AppSize.defaultStrokeWidth,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppRadius.defaultRadius,
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
                        enabled: controller.isEditable.value,
                        hintText: AppStrings.updatePhoneNumberHint.tr,
                        hintStyle: getRegularStyle(
                          color: ColorManager.textFieldGrey,
                        ),
                      ),
                      validator: (value) {
                        if (!value!.startsWith('09')) {
                          return AppStrings.phoneNumberError.tr;
                        } else if (value.trim() == '' || value.length < 9) {
                          return AppStrings.phoneNumberInvalid.tr;
                        } else {
                          return null;
                        }
                      },
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.nrc,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText: controller.driver.value!.nrc,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.address,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    Obx(
                      () => TextFormField(
                        maxLength: 240,
                        focusNode: controller.addressFocusNode.value,
                        controller: controller.addressController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: getTextStyle().copyWith(
                          color: ColorManager.textOnPrimary,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: controller.isEditable.value,
                          focusColor: ColorManager.black,
                          fillColor: ColorManager.cardColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.cardColor,
                              width: AppSize.defaultStrokeWidth,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppRadius.defaultRadius,
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
                          enabled: controller.isEditable.value,
                          hintText: AppStrings.updateAddressHint.tr,
                          hintStyle: getRegularStyle(
                            color: ColorManager.textFieldGrey,
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim() == '') {
                            return AppStrings.updateAddressHint.tr;
                          } else if (value.length < 4) {
                            return AppStrings.addressTooShortHint.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.dateOfBirth,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText:
                          DateFormat.yMMMMd(Get.locale!.toLanguageTag())
                              .format(controller.driver.value!.dateOfBirth),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.gender,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText: controller.driver.value!.gender,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.licenseNumber,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText: controller.driver.value!.licenseNumber,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.licenseColor,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText: controller.driver.value!.licenseColor,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    CustomText(
                      text: AppStrings.licenseExpiredDate,
                      style: TextStyle(
                        color: ColorManager.textColorVariant,
                      ),
                    ),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    ProfileTextField(
                      preFilledText:
                          DateFormat.yMMMMd(Get.locale!.toLanguageTag()).format(
                              controller.driver.value!.licenseCardExpiredDate),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
