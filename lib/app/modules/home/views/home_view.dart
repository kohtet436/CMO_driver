import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/strings_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import 'after_route_start_view.dart';
import 'before_route_start_view.dart';
import '../../../core/helper/constant.dart';
import '../controllers/home_controller.dart';
import 'no_more_ferry_stop_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (controller.dailyRoute.value!.endTime.toIso8601String() !=
              DEFAULT_TIME) {
            // Get.toNamed(
            //   Routes.EMPLOYEE_ATTENDANCE_LIST_PAGE,
            //   arguments: {
            //     'dailyRouteId': controller.dailyRoute.value!.id,
            //     'isEditable': true,
            //   },
            // );
            return const Center(
              child: CustomText(
                text: AppStrings.routeEnded,
              ),
            );
          }
          if (controller.nextSequenceNumber.value == -1 &&
              !controller.dailyRoute.value!.ferryStops
                  .any((ferryStop) => ferryStop.isCurrent == true)) {
            return const NoMoreFeryStopView();
          } else if (controller.dailyRoute.value!.startTime.toIso8601String() ==
              DEFAULT_TIME) {
            return const BeforeRouteStartView();
          } else if (controller.dailyRoute.value!.endTime.toIso8601String() ==
              DEFAULT_TIME) {
            return const AfterRouteStartView();
          } else {
            return Container();
          }
        }
      }),
    );
  }
}
