import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/values_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/leave_card.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../controllers/leaves_page_controller.dart';

class LeavesPageView extends GetView<LeavesPageController> {
  const LeavesPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => (!controller.isPendingDriverLeave.value &&
                    controller.isDriverLeave() &&
                    !controller.isLoadingDriver.value) ||
                (!controller.isPendingVehileLeave.value &&
                    !controller.isDriverLeave() &&
                    !controller.isLoadingVehicle.value)
            ? FloatingActionButton(
                onPressed: () => controller.goToLeaveRequestPage(),
                child: const Icon(Icons.add_circle_outline),
              )
            : Container(),
      ),
      body: Obx(
        () => controller.isLoadingDriver.value ||
                controller.isLoadingVehicle.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: WidgetUtil.defaultHorizontalPadding(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.fetchData();
                  },
                  child: ListView(
                    children: [
                      Padding(
                        padding: WidgetUtil.defaultVerticalPadding(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceChip(
                              selectedColor: ColorManager.choiceChipColor,
                              label:
                                  CustomText(text: AppStrings.driverLeave.tr),
                              selected: controller.isDriverLeave(),
                              onSelected: (value) => controller.changeIndex(0),
                            ),
                            ChoiceChip(
                              selectedColor: ColorManager.choiceChipColor,
                              label:
                                  CustomText(text: AppStrings.vehicleLeave.tr),
                              selected: controller.isVehicleLeave(),
                              onSelected: (value) => controller.changeIndex(1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: WidgetUtil.defaultVerticalPadding(),
                        child: controller.isDriverLeave()
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.isPendingDriverLeave.value)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomText(
                                          text: AppStrings.pendingLeave,
                                          style: TextStyle(
                                            fontWeight: FontWeightManager.bold,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                        if (controller
                                            .isPendingDriverLeave.value)
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.dialog(
                                                leaveCancelConfitmDialog(
                                                  () => controller
                                                      .cancelDriverLeave(
                                                    controller
                                                        .pendingDriverLeave
                                                        .value!
                                                        .id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const CustomText(
                                              text: AppStrings.cancelLeave,
                                            ),
                                          ),
                                      ],
                                    ),
                                  if (controller.isPendingDriverLeave.value)
                                    Padding(
                                      padding:
                                          WidgetUtil.defaultVerticalPadding(),
                                      child: LeaveCard(
                                        leave: Left(controller
                                            .pendingDriverLeave.value!),
                                      ),
                                    ),
                                  const CustomText(
                                    text: AppStrings.leaveHistory,
                                    style: TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s18,
                                    ),
                                  ),
                                  WidgetUtil.spaceVertical(
                                      AppPadding.defaultPadding),
                                  Column(
                                    children: controller.driverLeaveList
                                        .map((leave) =>
                                            LeaveCard(leave: Left(leave)))
                                        .toList(),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.isPendingVehileLeave.value)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomText(
                                          text: AppStrings.pendingLeave,
                                          style: TextStyle(
                                            fontWeight: FontWeightManager.bold,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                        if (controller
                                            .isPendingVehileLeave.value)
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.dialog(
                                                leaveCancelConfitmDialog(
                                                  () => controller
                                                      .cancelVehicleLeave(
                                                    controller
                                                        .pendingVehicleLeave
                                                        .value!
                                                        .id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const CustomText(
                                              text: AppStrings.cancelLeave,
                                            ),
                                          ),
                                      ],
                                    ),
                                  if (controller.isPendingVehileLeave.value)
                                    Padding(
                                      padding:
                                          WidgetUtil.defaultVerticalPadding(),
                                      child: LeaveCard(
                                        leave: Right(controller
                                            .pendingVehicleLeave.value!),
                                      ),
                                    ),
                                  const CustomText(
                                    text: AppStrings.leaveHistory,
                                    style: TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s18,
                                    ),
                                  ),
                                  WidgetUtil.spaceVertical(
                                      AppPadding.defaultPadding),
                                  Column(
                                    children: controller.vehicleLeaveList
                                        .map((leave) =>
                                            LeaveCard(leave: Right(leave)))
                                        .toList(),
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Dialog leaveCancelConfitmDialog(Function cancelFunc) {
  return Dialog(
    child: Padding(
      padding: WidgetUtil.defaultAllPadding(),
      child: ListView(
        shrinkWrap: true,
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
            text: AppStrings.cancelLeaveConfirmText,
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
                    cancelFunc();
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
  );
}
