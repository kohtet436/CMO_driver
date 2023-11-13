import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/daily_route_ferry_stop_list_page_controller.dart';
import '../../../core/widget/daily_route_ferry_stop_list_card.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';

class DailyRouteFerryStopListPageView
    extends GetView<DailyRouteFerryStopListPageController> {
  const DailyRouteFerryStopListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          WidgetUtil.defaultAppBar(title: AppStrings.ferryStopList, actions: [
        IconButton(
          onPressed: () {
            controller.getDailyRoute();
          },
          icon: const Icon(
            Icons.refresh,
          ),
        ),
      ]),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: WidgetUtil.defaultAllPadding(),
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
                            controller.dailyRouteFerryStops[index]),
                    itemCount: controller.dailyRouteFerryStops.length),
              ),
      ),
    );
  }
}
