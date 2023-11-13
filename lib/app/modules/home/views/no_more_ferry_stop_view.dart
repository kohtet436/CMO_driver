import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class NoMoreFeryStopView extends GetView<HomeController> {
  const NoMoreFeryStopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: WidgetUtil.defaultAllPadding(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            Get.dialog(
              Dialog(
                child: Padding(
                  padding: WidgetUtil.defaultAllPadding(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        text: AppStrings.endRouteConfirmText,
                      ),
                      WidgetUtil.spaceVertical(AppPadding.p16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: raisedButtonStyle.copyWith(
                                backgroundColor: MaterialStatePropertyAll(
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
                          WidgetUtil.spaceHorizontal(AppPadding.p16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                Get.back();
                                await Get.toNamed(
                                  Routes.EMPLOYEE_ATTENDANCE_LIST_PAGE,
                                  arguments: {
                                    'dailyRouteId':
                                        controller.dailyRoute.value!.id,
                                    'isEditable': true,
                                  },
                                );
                                controller.startEndRoute(
                                    controller.dailyRoute.value!.id);
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
            );
          },
          child: CustomText(
            text: AppStrings.endRoute,
            style: TextStyle(color: ColorManager.primaryColor),
          ),
        ),
      ),
      body: Padding(
        padding: WidgetUtil.defaultHorizontalPadding().copyWith(
          top: AppPadding.defaultPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.DAILY_ROUTE_FERRY_STOP_LIST_PAGE);
                  },
                  child: const CustomText(text: AppStrings.routeInfo),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.EMPLOYEE_ATTENDANCE_LIST_PAGE,
                      arguments: {
                        'dailyRouteId': controller.dailyRoute.value!.id,
                        'isEditable': false,
                      },
                    );
                  },
                  child: const CustomText(text: AppStrings.checkAttendance),
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: CustomText(text: AppStrings.noMoreRoute),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
