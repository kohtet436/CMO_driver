import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/util/method_util.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/daily_route_ferry_stop_list_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class BeforeRouteStartView extends GetView<HomeController> {
  const BeforeRouteStartView({Key? key}) : super(key: key);

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
                        text: AppStrings.startRouteConfirmText,
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
            text: AppStrings.startRoute,
            style: TextStyle(color: ColorManager.primaryColor),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getDailyRoute();
        },
        child: Padding(
          padding: WidgetUtil.defaultHorizontalPadding(),
          child: Column(
            children: [
              Padding(
                padding: WidgetUtil.defaultVerticalPadding(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: DateFormat.yMMMd(Get.locale!.toLanguageTag())
                              .format(
                            controller.dailyRoute.value!.date,
                          ),
                        ),
                        CustomText(
                          text:
                              "${DateFormat.EEEE(Get.locale!.toLanguageTag()).format(
                            controller.dailyRoute.value!.date,
                          )} (${MethodUtil.routeTypeToString(controller.dailyRoute.value!.routeType).tr})",
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(
                        Routes.EMPLOYEE_ATTENDANCE_LIST_PAGE,
                        arguments: {
                          'dailyRouteId': controller.dailyRoute.value!.id,
                          'isEditable': false,
                        },
                      ),
                      child: const CustomText(
                        text: AppStrings.checkAttendance,
                      ),
                    ),
                  ],
                ),
              ),
              WidgetUtil.horizontalLine1(),
              WidgetUtil.spaceVertical(AppPadding.p20),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            SizedBox(
                              width: AppSize.s30,
                              height: AppSize.s60,
                              child: VerticalDivider(
                                  thickness: 1, color: Colors.black),
                            )
                          ],
                        ),
                    itemBuilder: (context, index) => DailyRouteFerryStopCard(
                        dailyRouteFerryStop:
                            controller.dailyRoute.value!.ferryStops[index]),
                    itemCount: controller.dailyRoute.value!.ferryStops.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
