import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/font_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../data/model/request_models/update_employee_attendance_request.dart';
import '../../../data/model/daily_route_employee.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/daily_route_employee_card.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../controllers/employee_attendance_list_page_controller.dart';

class EmployeeAttendanceListPageView
    extends GetView<EmployeeAttendanceListPageController> {
  const EmployeeAttendanceListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtil.defaultAppBar(
          title: AppStrings.employeeAttendance,
          actions: [
            IconButton(
              onPressed: () {
                controller.getEmployees();
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
                child: Column(
                  children: [
                    Wrap(
                      spacing: AppSize.s10,
                      children: [
                        // Present chip
                        WidgetUtil.customChoicChip(
                          label: AppStrings.present,
                          color: ColorManager.secondaryColor,
                          selected: controller.isPresentSelected.value,
                          onSelected: (value) => controller.updateFilter(
                              controller.isPresentSelected, value),
                        ),
                        // Absent chip
                        WidgetUtil.customChoicChip(
                          label: AppStrings.absent,
                          color: ColorManager.secondaryColor,
                          selected: controller.isAbsentSelected.value,
                          onSelected: (value) => controller.updateFilter(
                              controller.isAbsentSelected, value),
                        ),
                        // Late chip
                        WidgetUtil.customChoicChip(
                          label: AppStrings.late,
                          color: ColorManager.secondaryColor,
                          selected: controller.isLateSelected.value,
                          onSelected: (value) => controller.updateFilter(
                              controller.isLateSelected, value),
                        ),
                        // Leave chip
                        WidgetUtil.customChoicChip(
                          label: AppStrings.leave,
                          color: ColorManager.secondaryColor,
                          selected: controller.isLeaveSelected.value,
                          onSelected: (value) => controller.updateFilter(
                              controller.isLeaveSelected, value),
                        ),
                        // Coming chip
                        WidgetUtil.customChoicChip(
                          label: AppStrings.coming,
                          color: ColorManager.secondaryColor,
                          selected: controller.isComingSelected.value,
                          onSelected: (value) => controller.updateFilter(
                              controller.isComingSelected, value),
                        ),
                      ],
                    ),
                    WidgetUtil.spaceVertical(AppPadding.p16),
                    WidgetUtil.horizontalLine1(),
                    WidgetUtil.spaceVertical(AppPadding.p16),
                    controller.isPageBlank()
                        ? Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: controller.employees.map(
                                (employee) {
                                  if ((employee.status ==
                                              EmployeeAttendance.PRESENT &&
                                          controller.isPresentSelected.value) ||
                                      (employee.status ==
                                              EmployeeAttendance.ABSENT &&
                                          controller.isAbsentSelected.value) ||
                                      (employee.status ==
                                              EmployeeAttendance.LATE &&
                                          controller.isLateSelected.value) ||
                                      (employee.status ==
                                              EmployeeAttendance.LEAVE &&
                                          controller.isLeaveSelected.value) ||
                                      (employee.status ==
                                              EmployeeAttendance.COMING &&
                                          controller.isComingSelected.value)) {
                                    return DailyRouteEmployeeCard(
                                      employeeId: employee.employeeId,
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ).toList(),
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: CustomText(
                                text: AppStrings.noEmployee,
                              ),
                            ),
                          ),
                    if (controller.isEditable)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Get.dialog(
                            Dialog(
                              child: Padding(
                                padding: WidgetUtil.defaultAllPadding(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
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
                                      text:
                                          AppStrings.sendAttendanceConfirmText,
                                    ),
                                    WidgetUtil.spaceVertical(AppPadding.p16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: raisedButtonStyle.copyWith(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                ColorManager.grey,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: CustomText(
                                              text: AppStrings.backButton,
                                              style: TextStyle(
                                                color:
                                                    ColorManager.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        WidgetUtil.spaceHorizontal(
                                            AppPadding.p16),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              Get.back();
                                              List<UpdateEmployeeAttendanceRequest>
                                                  updateEmployeeAttendanceRequestList =
                                                  [];
                                              for (DailyRouteEmployee employee
                                                  in controller.employees) {
                                                if (employee.status !=
                                                    controller
                                                            .originalAttendance[
                                                        employee.employeeId]) {
                                                  updateEmployeeAttendanceRequestList
                                                      .add(
                                                    UpdateEmployeeAttendanceRequest(
                                                      employeeId:
                                                          employee.employeeId,
                                                      dailyRouteId:
                                                          employee.dailyRouteId,
                                                      status: employee.status,
                                                    ),
                                                  );
                                                }
                                              }
                                              controller
                                                  .updateDailyRouteEmployeeAttendance(
                                                      updateEmployeeAttendanceRequestList);
                                            },
                                            child: CustomText(
                                              text: AppStrings.confirmButton,
                                              style: TextStyle(
                                                color:
                                                    ColorManager.primaryColor,
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
                        },
                        child: CustomText(
                          text: AppStrings.sendText,
                          style: TextStyle(color: ColorManager.primaryColor),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
