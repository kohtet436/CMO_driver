import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/helper/app_enum.dart';
import '../../../core/helper/constant.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../data/model/response_models/daily_route_ferry_stop.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class AfterRouteStartView extends GetView<HomeController> {
  const AfterRouteStartView({Key? key}) : super(key: key);

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
                      CustomText(
                        text: controller.isCheckedIn.value
                            ? AppStrings.checkOutConfirmText
                            : AppStrings.checkInConfirmText,
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
                              onPressed: () {
                                Get.back();
                                controller.checkInOut(
                                  controller.dailyRoute.value!.id,
                                  controller.isCheckedIn.value
                                      ? controller.dailyRoute.value!.ferryStops
                                          .firstWhere((ferryStop) =>
                                              ferryStop.id ==
                                              controller.dailyRoute.value!
                                                  .lastFerryStopId)
                                          .ferryStopId
                                      : controller
                                          .nextFerryStop.value!.ferryStopId,
                                );
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
          child: Obx(
            () => CustomText(
              text: controller.isCheckedIn.value
                  ? AppStrings.checkOut
                  : AppStrings.checkIn,
              style: TextStyle(color: ColorManager.primaryColor),
            ),
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Padding(
                      padding: WidgetUtil.defaultVerticalPadding(),
                      child: CustomText(
                        text: controller.isCheckedIn.value
                            ? AppStrings.currentFerryStop
                            : AppStrings.nextFerryStop,
                        style: const TextStyle(
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                  ),
                  controller.isCheckedIn.value
                      ? getDailyRouteFerryStopCard(controller
                          .dailyRoute.value!.ferryStops
                          .firstWhere((ferryStop) =>
                              ferryStop.id ==
                              controller.dailyRoute.value!.lastFerryStopId))
                      : getDailyRouteFerryStopCard(
                          controller.nextFerryStop.value!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Card getDailyRouteFerryStopCard(DailyRouteFerryStop ferryStop) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s16),
    ),
    child: Padding(
      padding: WidgetUtil.defaultCardPadding(),
      child: Column(
        children: [
          const FaIcon(
            FontAwesomeIcons.bus,
            size: AppSize.s50,
          ),
          WidgetUtil.spaceVertical(AppPadding.defaultPadding),
          CustomText(
            text: Get.locale == ENG_LOCALE
                ? ferryStop.ferryStopName
                : ferryStop.ferryStopMmName,
            style: const TextStyle(
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s20,
            ),
          ),
          CustomText(
            text: Get.locale == ENG_LOCALE
                ? '${ferryStop.roadName}, ${ferryStop.townshipName}'
                : '${ferryStop.roadMmName}၊ ${ferryStop.townshipMmName}',
          ),
          WidgetUtil.spaceVertical(AppPadding.defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.personCircleCheck,
                    size: AppSize.s20,
                  ),
                  WidgetUtil.spaceHorizontal(AppPadding.defaultPadding),
                  CustomText(
                    text: ferryStop.employees
                        .where((employee) =>
                            employee.status != EmployeeAttendance.LEAVE)
                        .length
                        .toString(),
                    style: const TextStyle(
                      fontSize: AppSize.s18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.personCircleXmark,
                    size: AppSize.s20,
                  ),
                  WidgetUtil.spaceHorizontal(AppPadding.defaultPadding),
                  CustomText(
                    text: ferryStop.employees
                        .where((employee) =>
                            employee.status == EmployeeAttendance.LEAVE)
                        .length
                        .toString(),
                    style: const TextStyle(
                      fontSize: AppSize.s18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
