import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/driver_leave.dart';
import '../../data/model/vehicle_leave.dart';
import '../values/values_manager.dart';
import '../values/color_manager.dart';
import '../util/widget_util.dart';
import '../values/font_manager.dart';
import '../values/strings_manager.dart';
import 'custom_text_widgets.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({
    super.key,
    required this.leave,
  });

  final Either<DriverLeave, VehicleLeave> leave;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: WidgetUtil.defaultCardPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: DateFormat.yMd(Get.locale!.toLanguageTag()).format(
                        leave.fold((l) => l.startDate, (r) => r.startDate))),
                if (leave.fold((l) => DateFormat.yMd().format(l.startDate),
                        (r) => DateFormat.yMd().format(r.startDate)) !=
                    leave.fold((l) => DateFormat.yMd().format(l.endDate),
                        (r) => DateFormat.yMd().format(r.endDate)))
                  const CustomText(
                    text: AppStrings.rangeSpacer,
                  ),
                if (leave.fold((l) => DateFormat.yMd().format(l.startDate),
                        (r) => DateFormat.yMd().format(r.startDate)) !=
                    leave.fold((l) => DateFormat.yMd().format(l.endDate),
                        (r) => DateFormat.yMd().format(r.endDate)))
                  CustomText(
                      text: DateFormat.yMd(Get.locale!.toLanguageTag()).format(
                          leave.fold((l) => l.endDate, (r) => r.endDate))),
              ],
            ),
            WidgetUtil.spaceVertical(AppPadding.p16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: AppStrings.status.tr),
                const CustomText(text: AppStrings.colon),
                WidgetUtil.normalBurmeseText(
                    leave.fold((l) => l.leaveStatus, (r) => r.leaveStatus)),
              ],
            ),
            WidgetUtil.spaceVertical(AppPadding.p16),
            ReadMoreText(
              leave.fold((l) => l.reason, (r) => r.reason),
              trimLines: 2,
              trimMode: TrimMode.Line,
              style: normalBurmeseFontStyle,
              moreStyle: normalBurmeseFontStyle.copyWith(
                color: ColorManager.secondaryColor,
              ),
              lessStyle: normalBurmeseFontStyle.copyWith(
                color: ColorManager.secondaryColor,
              ),
              trimExpandedText: ' Show less',
              trimCollapsedText: ' Show more',
            ),
          ],
        ),
      ),
    );
  }
}
