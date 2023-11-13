import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/helper/constant.dart';
import '../../../data/model/driver_leave_request.dart';
import '../../../data/model/vehicle_leave_request.dart';
import '../../../data/repository/leave_repository.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/widget/custom_text_widgets.dart';

class LeaveRequestPageController extends GetxController {
  final isPendingDriverLeave = Get.arguments['isPendingDriverLeave'];
  final isPendingVehicleLeave = Get.arguments['isPendingVehicleLeave'];

  final Rx<LeaveType> leaveType = (Get.arguments['leaveType'] as LeaveType).obs;
  final Rx<LeaveDayCount> leaveDayCount = LeaveDayCount.ONE_DAY.obs;
  final Rx<DateTime> startDate = DateTime.now()
      .add(const Duration(
        days: 1,
      ))
      .obs;
  final Rx<DateTime> endDate = DateTime.now()
      .add(const Duration(
        days: 1,
      ))
      .obs;
  final TextEditingController leaveReasonController = TextEditingController();

  final LeaveRepository leaveRepository = Get.find();

  void pickStartDate(DateTime date) {
    startDate.value = date;
    endDate.value = date;
    Get.back();
  }

  void pickEndDate(DateTime date) {
    endDate.value = date;
    Get.back();
  }

  void requestDriverLeave(DriverLeaveRequest driverLeaveRequest) {
    leaveRepository.requestDriverLeave(driverLeaveRequest);
  }

  void requestVehicleLeave(VehicleLeaveRequest vehicleLeaveRequest) {
    leaveRepository.requestVehicleLeave(vehicleLeaveRequest);
  }

  void submit() {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: ListView(
            shrinkWrap: true,
            children: [
              const CustomText(
                text: AppStrings.leaveType,
                style: TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              if (leaveType.value == LeaveType.DRIVER_LEAVE)
                const CustomText(
                  text: AppStrings.driverLeave,
                ),
              if (leaveType.value == LeaveType.VEHICLE_LEAVE)
                const CustomText(
                  text: AppStrings.vehicleLeave,
                ),
              WidgetUtil.spaceVertical(AppPadding.p16),
              const CustomText(
                text: AppStrings.leaveDate,
                style: TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: DateFormat.yMd(Get.locale!.toLanguageTag())
                          .format(startDate.value)),
                  if (leaveDayCount.value == LeaveDayCount.MORE_THAN_ONE_DAY)
                    const CustomText(
                      text: AppStrings.rangeSpacer,
                    ),
                  if (leaveDayCount.value == LeaveDayCount.MORE_THAN_ONE_DAY)
                    CustomText(
                        text: DateFormat.yMd(Get.locale!.toLanguageTag())
                            .format(endDate.value)),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.p16),
              const CustomText(
                text: AppStrings.leaveReason,
                style: TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              CustomText(
                text: leaveReasonController.text,
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
                        switch (leaveType.value) {
                          case LeaveType.DRIVER_LEAVE:
                            final driverLeaveRequest = DriverLeaveRequest(
                              vehicleEmployeeId: TEST_ID,
                              reason: leaveReasonController.text,
                              startDate: startDate.value,
                              endDate: endDate.value,
                            );

                            requestDriverLeave(driverLeaveRequest);
                            break;

                          case LeaveType.VEHICLE_LEAVE:
                            final vehicleLeaveRequest = VehicleLeaveRequest(
                              vehicleId: '71176c6f-45e1-48d7-89b0-bffa1953a8fd',
                              reason: leaveReasonController.text,
                              startDate: startDate.value,
                              endDate: endDate.value,
                            );

                            requestVehicleLeave(vehicleLeaveRequest);
                            break;
                        }
                        Get.back();
                        Get.back();
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
  }

  @override
  void onClose() {
    leaveReasonController.dispose();
    super.onClose();
  }
}
