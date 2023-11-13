import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constant.dart';
import '../values/values_manager.dart';
import 'circular_profile.dart';
import '../../data/model/employee.dart';
import '../util/widget_util.dart';
import 'custom_text_widgets.dart';

class BaseRouteEmployeeCard extends StatelessWidget {
  const BaseRouteEmployeeCard({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetUtil.defaultHorizontalPadding().copyWith(
        bottom: AppPadding.defaultPadding,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: WidgetUtil.defaultCardPadding(),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircularProfile(imageUrl: employee.photoPath),
              ),
              WidgetUtil.spaceHorizontal(AppPadding.p20),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: employee.name,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.p4),
                    CustomText(
                      text: employee.phoneNumber,
                    ),
                    WidgetUtil.spaceVertical(AppPadding.p4),
                    CustomText(
                      text: Get.locale == ENG_LOCALE
                          ? employee.ferryStopName
                          : employee.ferryStopMmName,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
