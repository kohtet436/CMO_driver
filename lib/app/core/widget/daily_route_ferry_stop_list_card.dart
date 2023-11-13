import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/response_models/daily_route_ferry_stop.dart';
import '../helper/constant.dart';
import '../util/widget_util.dart';
import '../values/values_manager.dart';
import 'custom_text_widgets.dart';

class DailyRouteFerryStopCard extends StatelessWidget {
  const DailyRouteFerryStopCard({
    super.key,
    required this.dailyRouteFerryStop,
  });

  final DailyRouteFerryStop dailyRouteFerryStop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FaIcon(
          FontAwesomeIcons.bus,
          size: AppSize.s32,
        ),
        WidgetUtil.spaceHorizontal(32),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10)),
            child: Padding(
              padding: const EdgeInsets.only(left: AppPadding.p20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                  CustomText(
                    text: Get.locale == ENG_LOCALE
                        ? dailyRouteFerryStop.ferryStopName
                        : dailyRouteFerryStop.ferryStopMmName,
                  ),
                  WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                  CustomText(
                    text: Get.locale == ENG_LOCALE
                        ? '${dailyRouteFerryStop.roadName}, ${dailyRouteFerryStop.townshipName}'
                        : '${dailyRouteFerryStop.roadMmName}၊ ${dailyRouteFerryStop.townshipMmName}',
                  ),
                  WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
