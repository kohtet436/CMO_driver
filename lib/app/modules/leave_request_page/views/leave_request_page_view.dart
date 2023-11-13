import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../../core/values/font_manager.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../controllers/leave_request_page_controller.dart';

class LeaveRequestPageView extends GetView<LeaveRequestPageController> {
  const LeaveRequestPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtil.defaultAppBar(title: AppStrings.leaveRequestAppBar.tr),
      body: Obx(
        () => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: WidgetUtil.defaultAllPadding(),
                  children: [
                    // Leave Type Section
                    const CustomText(
                      text: AppStrings.leaveType,
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    if (!controller.isPendingDriverLeave)
                      RadioMenuButton(
                        value: LeaveType.DRIVER_LEAVE,
                        groupValue: controller.leaveType.value,
                        onChanged: (value) {
                          controller.leaveType.value = value as LeaveType;
                        },
                        child: const CustomText(
                          text: AppStrings.driverLeave,
                        ),
                      ),
                    if (!controller.isPendingVehicleLeave)
                      RadioMenuButton(
                        value: LeaveType.VEHICLE_LEAVE,
                        groupValue: controller.leaveType.value,
                        onChanged: (value) {
                          controller.leaveType.value = value as LeaveType;
                        },
                        child: const CustomText(
                          text: AppStrings.vehicleLeave,
                        ),
                      ),
                    Padding(
                      padding: WidgetUtil.defaultVerticalPadding(),
                      child: WidgetUtil.horizontalLine1(),
                    ),
                    // Leave Day Count Section
                    const CustomText(
                      text: AppStrings.leaveDays,
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    RadioMenuButton(
                      value: LeaveDayCount.ONE_DAY,
                      groupValue: controller.leaveDayCount.value,
                      onChanged: (value) {
                        controller.leaveDayCount.value = value as LeaveDayCount;
                      },
                      child: const CustomText(
                        text: AppStrings.oneDayLeave,
                      ),
                    ),
                    RadioMenuButton(
                      value: LeaveDayCount.MORE_THAN_ONE_DAY,
                      groupValue: controller.leaveDayCount.value,
                      onChanged: (value) {
                        controller.leaveDayCount.value = value as LeaveDayCount;
                      },
                      child: const CustomText(
                        text: AppStrings.multipleDaysLeave,
                      ),
                    ),
                    Padding(
                      padding: WidgetUtil.defaultVerticalPadding(),
                      child: WidgetUtil.horizontalLine1(),
                    ),
                    // Leave Date Section
                    const CustomText(
                      text: AppStrings.leaveDate,
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                              DateFormat.yMd(Get.locale!.toLanguageTag())
                                  .format(controller.startDate.value)),
                          onPressed: () => Get.dialog(
                            Dialog(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  SfDateRangePicker(
                                    showActionButtons: true,
                                    onCancel: () => Get.back(),
                                    onSubmit:
                                        (dateRangePickerSelectionChangedArgs) =>
                                            controller.pickStartDate(
                                                dateRangePickerSelectionChangedArgs
                                                    as DateTime),
                                    initialSelectedDate:
                                        controller.startDate.value,
                                    minDate: controller.startDate.value,
                                    selectionMode:
                                        DateRangePickerSelectionMode.single,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (controller.leaveDayCount.value ==
                            LeaveDayCount.MORE_THAN_ONE_DAY)
                          const CustomText(
                            text: AppStrings.rangeSpacer,
                          ),
                        if (controller.leaveDayCount.value ==
                            LeaveDayCount.MORE_THAN_ONE_DAY)
                          TextButton(
                            child: Text(
                                DateFormat.yMd(Get.locale!.toLanguageTag())
                                    .format(controller.endDate.value)),
                            onPressed: () => Get.dialog(
                              Dialog(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    SfDateRangePicker(
                                      showActionButtons: true,
                                      onCancel: () => Get.back(),
                                      onSubmit:
                                          (dateRangePickerSelectionChangedArgs) =>
                                              controller.pickEndDate(
                                                  dateRangePickerSelectionChangedArgs
                                                      as DateTime),
                                      initialSelectedDate:
                                          controller.endDate.value,
                                      minDate: controller.startDate.value,
                                      selectionMode:
                                          DateRangePickerSelectionMode.single,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: WidgetUtil.defaultVerticalPadding(),
                      child: WidgetUtil.horizontalLine1(),
                    ),
                    // Leave Reason Section
                    const CustomText(
                      text: AppStrings.leaveReason,
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        controller: controller.leaveReasonController,
                        cursorColor: ColorManager.secondaryColor,
                        style: normalBurmeseFontStyle.copyWith(
                            color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                      ),
                    ),
                    WidgetUtil.horizontalLine1(),
                  ],
                ),
              ),
              Padding(
                padding: WidgetUtil.defaultAllPadding(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (controller.leaveReasonController.text.isEmpty) {
                      Get.dialog(
                        Dialog(
                          child: Padding(
                            padding: WidgetUtil.defaultAllPadding(),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                const CustomText(
                                  text: AppStrings.warning,
                                  style: TextStyle(
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWeightManager.bold,
                                  ),
                                ),
                                WidgetUtil.spaceVertical(AppPadding.p16),
                                const CustomText(
                                  text: AppStrings.leaveReasonEmptyWarning,
                                ),
                                WidgetUtil.spaceVertical(AppPadding.p16),
                                ElevatedButton(
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
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      controller.submit();
                    }
                  },
                  child: CustomText(
                    text: AppStrings.leaveRequestButton,
                    style: TextStyle(color: ColorManager.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
