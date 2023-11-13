import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/employee_attendance_list_page/controllers/employee_attendance_list_page_controller.dart';
import '../helper/app_enum.dart';
import '../helper/constant.dart';
import '../util/widget_util.dart';
import '../values/color_manager.dart';
import '../values/strings_manager.dart';
import '../values/values_manager.dart';
import 'circular_profile.dart';
import 'custom_text_widgets.dart';

class DailyRouteEmployeeCard
    extends GetView<EmployeeAttendanceListPageController> {
  const DailyRouteEmployeeCard({
    super.key,
    required this.employeeId,
  });

  final String employeeId;

  @override
  Widget build(BuildContext context) {
    RadioListTile getAttendanceRadioListTile({
      required String label,
      required EmployeeAttendance newValue,
    }) {
      return RadioListTile(
        value: newValue,
        groupValue: controller.employees
            .firstWhere((employee) => employee.employeeId == employeeId)
            .status,
        onChanged: (value) {
          Get.back();
          controller.employees
              .firstWhere((employee) => employee.employeeId == employeeId)
              .status = value;
          controller.employees.refresh();
          controller.filterEmployees();
          // Get.dialog(
          //   Dialog(
          //     child: Padding(
          //       padding: WidgetUtil.defaultAllPadding(),
          //       child: ListView(
          //         shrinkWrap: true,
          //         children: [
          //           const CustomText(
          //             text: AppStrings.confirmation,
          //             style: TextStyle(
          //               fontSize: FontSize.s18,
          //               fontWeight: FontWeightManager.bold,
          //             ),
          //           ),
          //           WidgetUtil.spaceVertical(AppPadding.p16),
          //           const CustomText(
          //             text: AppStrings.changeStatusConfirmText,
          //           ),
          //           WidgetUtil.spaceVertical(AppPadding.p16),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Expanded(
          //                 child: ElevatedButton(
          //                   style: raisedButtonStyle.copyWith(
          //                     backgroundColor: MaterialStatePropertyAll(
          //                       ColorManager.grey,
          //                     ),
          //                   ),
          //                   onPressed: () {
          //                     Get.back();
          //                   },
          //                   child: CustomText(
          //                     text: AppStrings.backButton,
          //                     style: TextStyle(
          //                       color: ColorManager.primaryColor,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               WidgetUtil.spaceHorizontal(AppPadding.p16),
          //               Expanded(
          //                 child: ElevatedButton(
          //                   onPressed: () {
          //                     updateStatus(UpdateEmployeeAttendanceRequest(
          //                       employeeId: employee.employeeId,
          //                       dailyRouteId: employee.dailyRouteId,
          //                       status: MethodUtil.stringToEmployeeAttendance(
          //                           label),
          //                     ));
          //                     Get.back();
          //                   },
          //                   child: CustomText(
          //                     text: AppStrings.confirmButton,
          //                     style: TextStyle(
          //                       color: ColorManager.primaryColor,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
        title: CustomText(
          text: label,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }

    CircleAvatar getStatusCircle(EmployeeAttendance status) {
      switch (status) {
        case EmployeeAttendance.PRESENT:
          return CircleAvatar(
            backgroundColor: ColorManager.presentStatus,
            child: Icon(
              Icons.check,
              color: ColorManager.white,
            ),
          );
        case EmployeeAttendance.ABSENT:
          return CircleAvatar(
            backgroundColor: ColorManager.absentStatus,
            child: Icon(
              Icons.close,
              color: ColorManager.white,
            ),
          );
        case EmployeeAttendance.LATE:
          return CircleAvatar(
            backgroundColor: ColorManager.lateStatus,
            child: Icon(
              Icons.warning,
              color: ColorManager.white,
            ),
          );
        case EmployeeAttendance.LEAVE:
          return CircleAvatar(
            backgroundColor: ColorManager.leaveStatus,
            child: Icon(
              Icons.calendar_today,
              color: ColorManager.white,
            ),
          );
        case EmployeeAttendance.COMING:
          return CircleAvatar(
            backgroundColor: ColorManager.comingStatus,
            child: Icon(
              Icons.more_horiz,
              color: ColorManager.white,
            ),
          );
      }
    }

    // return Card(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(AppSize.s16),
    // ),
    //   child: Stack(

    //     children: [
    //       Column(
    //         children: [
    //           Row(
    //             children: [
    // Expanded(
    //   flex: 2,
    //   child: CircularProfile(imageUrl: employee.photoPath),
    // ),
    //               WidgetUtil.spaceHorizontal(AppPadding.p20),
    //               Expanded(
    //                 flex: 5,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    // CustomText(
    //   text: employee.employeeName,
    // ),
    // WidgetUtil.spaceVertical(AppPadding.p4),
    // CustomText(
    //   text: Get.locale == ENG_LOCALE
    //       ? employee.ferryStopName
    //       : employee.ferryStopMmName,
    // ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       Positioned(
    //         top: -10,
    //         right: 10,
    //         child: Row(
    //           children: [
    //             WidgetUtil.getEmployeeStatus(employee.status),
    //             if (isEditable)
    //               IconButton(
    //                 icon: const Icon(
    //                   Icons.edit,
    //                 ),
    // onPressed: () {
    //   Get.dialog(
    //     Dialog(
    //       child: ListView(
    //         shrinkWrap: true,
    //         children: [
    //           getAttendanceRadioListTile(
    //             label: AppStrings.present,
    //             newValue: EmployeeAttendance.PRESENT,
    //           ),
    //           getAttendanceRadioListTile(
    //             label: AppStrings.absent,
    //             newValue: EmployeeAttendance.ABSENT,
    //           ),
    //           getAttendanceRadioListTile(
    //             label: AppStrings.late,
    //             newValue: EmployeeAttendance.LATE,
    //           ),
    //           getAttendanceRadioListTile(
    //             label: AppStrings.leave,
    //             newValue: EmployeeAttendance.LEAVE,
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // },
    //               ),
    //           ],
    //         ),
    //       ),
    //       if (employee.status == EmployeeAttendance.PRESENT ||
    //           employee.status == EmployeeAttendance.LATE)
    //         Positioned(
    //           bottom: 0,
    //           right: 10,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               const CustomText(
    //                 text: AppStrings.checkedInTime,
    //                 style: TextStyle(
    //                   fontSize: FontSize.s12,
    //                 ),
    //               ),
    //               CustomText(
    //                 text: DateFormat.Hm().format(employee.checkInTime),
    //                 style: const TextStyle(
    //                   fontSize: FontSize.s12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //     ],
    //   ),
    // );

    return Stack(
      children: [
        Obx(() {
          if (controller.employees
                  .firstWhere((employee) => employee.employeeId == employeeId)
                  .status !=
              controller.originalAttendance[employeeId]) {
            return Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.circle,
                size: 10,
                color: ColorManager.secondaryColor,
              ),
            );
          }
          return Container();
        }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                WidgetUtil.spaceHorizontal(AppSize.s16),
                Expanded(
                  flex: 2,
                  child: CircularProfile(
                      imageUrl: controller.employees
                          .firstWhere(
                              (employee) => employee.employeeId == employeeId)
                          .photoPath),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: WidgetUtil.defaultHorizontalPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: controller.employees
                              .firstWhere((employee) =>
                                  employee.employeeId == employeeId)
                              .employeeName,
                        ),
                        WidgetUtil.spaceVertical(AppPadding.p4),
                        CustomText(
                          text: Get.locale == ENG_LOCALE
                              ? controller.employees
                                  .firstWhere((employee) =>
                                      employee.employeeId == employeeId)
                                  .ferryStopName
                              : controller.employees
                                  .firstWhere((employee) =>
                                      employee.employeeId == employeeId)
                                  .ferryStopMmName,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: getStatusCircle(controller.employees
                        .firstWhere(
                            (employee) => employee.employeeId == employeeId)
                        .status),
                    iconSize: AppSize.s40,
                    splashColor: controller.isEditable
                        ? ThemeData.light().splashColor
                        : Colors.transparent,
                    highlightColor: controller.isEditable
                        ? ThemeData.light().highlightColor
                        : Colors.transparent,
                    onPressed: controller.isEditable
                        ? () {
                            Get.dialog(
                              Dialog(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    getAttendanceRadioListTile(
                                      label: AppStrings.present,
                                      newValue: EmployeeAttendance.PRESENT,
                                    ),
                                    getAttendanceRadioListTile(
                                      label: AppStrings.absent,
                                      newValue: EmployeeAttendance.ABSENT,
                                    ),
                                    getAttendanceRadioListTile(
                                      label: AppStrings.late,
                                      newValue: EmployeeAttendance.LATE,
                                    ),
                                    getAttendanceRadioListTile(
                                      label: AppStrings.leave,
                                      newValue: EmployeeAttendance.LEAVE,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        : () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
