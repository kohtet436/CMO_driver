import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart' as easy_stepper;
import 'package:get/get.dart';

import '../../data/model/base_route_ferry_stop.dart';
import '../helper/constant.dart';
import '../values/color_manager.dart';
import '../values/font_manager.dart';
import '../values/strings_manager.dart';
import '../values/values_manager.dart';
import 'custom_text_widgets.dart';

class BaseRouteFerryStopListCard extends StatelessWidget {
  const BaseRouteFerryStopListCard({
    super.key,
    required this.ferryStopList,
  });

  final List<BaseRouteFerryStop> ferryStopList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        textColor: Colors.black,
        collapsedTextColor: Colors.black,
        collapsedIconColor: Colors.black,
        iconColor: Colors.black,
        title: const CustomText(
          text: AppStrings.ferryStopsInfo,
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
          ),
        ),
        children: [
          Row(
            children: [
              easy_stepper.EasyStepper(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.p20),
                disableScroll: true,
                defaultLineColor: ColorManager.secondaryColor,
                activeStep: -1,
                lineLength: 90,
                lineType: easy_stepper.LineType.normal,
                direction: Axis.vertical,
                showTitle: false,
                showStepBorder: false,
                stepRadius: 30,
                steps: List<easy_stepper.EasyStep>.generate(
                  ferryStopList.length,
                  (index) => easy_stepper.EasyStep(
                    customStep: CircleAvatar(
                      backgroundColor: ColorManager.secondaryColor,
                      radius: 50,
                      child: Icon(
                        Icons.directions_bus_sharp,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ferryStopList
                      .map(
                        (routeFerryStop) => SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Get.locale == ENG_LOCALE
                                  ? CustomText(
                                      text: routeFerryStop.ferryStop.name,
                                      style: const TextStyle(
                                        fontSize: FontSize.s14,
                                      ),
                                    )
                                  : CustomText(
                                      text:
                                          routeFerryStop.ferryStop.myanmarName,
                                      style: const TextStyle(
                                        fontSize: FontSize.s12,
                                      ),
                                    ),
                              Get.locale == ENG_LOCALE
                                  ? CustomText(
                                      overflow: TextOverflow.ellipsis,
                                      text: routeFerryStop.ferryStop.road.name +
                                          AppStrings.spacer.tr +
                                          routeFerryStop
                                              .ferryStop.township.name,
                                      style: const TextStyle(
                                        fontSize: FontSize.s14,
                                      ),
                                    )
                                  : CustomText(
                                      overflow: TextOverflow.ellipsis,
                                      text: routeFerryStop
                                              .ferryStop.road.myanmarName +
                                          AppStrings.spacerBur +
                                          routeFerryStop
                                              .ferryStop.township.myanmarName,
                                      style: const TextStyle(
                                        fontSize: FontSize.s12,
                                      ),
                                    ),
                              CustomText(
                                text:
                                    '${AppStrings.employees.tr} - ${routeFerryStop.employees.length}',
                                style: TextStyle(
                                  fontSize: Get.locale == ENG_LOCALE
                                      ? FontSize.s14
                                      : FontSize.s12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
