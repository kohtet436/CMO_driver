import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/constant.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  const SettingsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: WidgetUtil.defaultAllPadding(),
        child: ListView(
          children: [
            const CustomText(
              text: AppStrings.privacyAndSecurity,
              style: TextStyle(
                fontWeight: FontWeightManager.bold,
              ),
            ),
            WidgetUtil.spaceVertical(AppPadding.p16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: WidgetUtil.defaultElevatedButtonPadding(),
              ),
              onPressed: () {
                Get.toNamed(Routes.CHANGE_PASSWORD_PAGE);
              },
              child: const CustomText(
                text: AppStrings.changePassword,
                style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ),
            WidgetUtil.spaceVertical(AppPadding.p28),
            const CustomText(
              text: AppStrings.language,
              style: TextStyle(
                fontWeight: FontWeightManager.bold,
              ),
            ),
            WidgetUtil.spaceVertical(AppPadding.p16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: WidgetUtil.defaultElevatedButtonPadding(),
              ),
              onPressed: () => Get.dialog(
                Dialog(
                  child: Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((value) => Get.updateLocale(MM_LOCALE));
                            GetStorage().write('isEng', false);
                          },
                          child: SizedBox(
                            height: AppSize.s150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromCode(
                                  height: AppSize.s50,
                                  FlagsCode.MM,
                                ),
                                WidgetUtil.spaceVertical(AppPadding.p16),
                                const CustomText(
                                  text: AppStrings.myanmar,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((value) => Get.updateLocale(ENG_LOCALE));
                            GetStorage().write('isEng', true);
                          },
                          child: SizedBox(
                            height: AppSize.s150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromCode(
                                  height: AppSize.s50,
                                  FlagsCode.GB,
                                ),
                                WidgetUtil.spaceVertical(AppPadding.p16),
                                const CustomText(
                                  text: AppStrings.english,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: const CustomText(
                text: AppStrings.changeLanguage,
                style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
