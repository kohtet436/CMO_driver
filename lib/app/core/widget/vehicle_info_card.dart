import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../values/font_manager.dart';
import '../values/strings_manager.dart';
import '../util/widget_util.dart';
import '../../data/model/vehicle.dart';
import 'custom_text_widgets.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      child: Column(
        children: [
          ExpansionTile(
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            collapsedIconColor: Colors.black,
            iconColor: Colors.black,
            title: const CustomText(
              text: AppStrings.vehicleInfo,
              style: TextStyle(
                fontWeight: FontWeightManager.bold,
              ),
            ),
            children: [
              Padding(
                padding: WidgetUtil.defaultCardPadding(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.vehicleModel,
                        ),
                        CustomText(
                          text: vehicle.vehicleType.model,
                        ),
                      ],
                    ),
                    WidgetUtil.horizontalLine1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.vehicleColor,
                        ),
                        CustomText(
                          text: vehicle.color,
                        ),
                      ],
                    ),
                    WidgetUtil.horizontalLine1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.vehicleLicensePlate,
                        ),
                        CustomText(
                          text: vehicle.licensePlate,
                        ),
                      ],
                    ),
                    WidgetUtil.horizontalLine1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.vehicleLicenseExpiredDate,
                        ),
                        CustomText(
                          text: DateFormat.yMd().format(
                            vehicle.plateExpiredDate,
                          ),
                        ),
                      ],
                    ),
                    WidgetUtil.horizontalLine1(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStrings.vehicleCapacity,
                        ),
                        CustomText(
                          text: vehicle.vehicleType.numberOfSeats.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
