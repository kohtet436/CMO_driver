import 'package:get/get.dart';

import '../../../data/model/request_models/update_employee_attendance_request.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/helper/helper.dart';
import '../../../data/model/daily_route_employee.dart';
import '../../../data/repository/employee_repository.dart';

class EmployeeAttendanceListPageController extends GetxController {
  final employees = <DailyRouteEmployee>[].obs;
  Map<String, EmployeeAttendance> originalAttendance = {};

  final String dailyRouteId = Get.arguments['dailyRouteId'];

  final presentEmployees = <DailyRouteEmployee>[].obs;
  final absentEmployees = <DailyRouteEmployee>[].obs;
  final lateEmployees = <DailyRouteEmployee>[].obs;
  final leaveEmployees = <DailyRouteEmployee>[].obs;
  final comingEmployees = <DailyRouteEmployee>[].obs;

  final bool isEditable = Get.arguments['isEditable'] ?? false;

  final isLoading = false.obs;

  final isPresentSelected = true.obs;
  final isAbsentSelected = true.obs;
  final isLateSelected = true.obs;
  final isLeaveSelected = true.obs;
  final isComingSelected = true.obs;

  final EmployeeRepository employeeRepository = Get.find();

  void getEmployees() async {
    try {
      isLoading(true);
      final employeesData =
          await employeeRepository.getDailyRouteEmployeeList(dailyRouteId);
      employeesData.fold(
        (data) {
          employees.assignAll(data);
          for (DailyRouteEmployee employee in employees) {
            originalAttendance[employee.employeeId] = employee.status;
          }
          filterEmployees();
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void updateDailyRouteEmployeeAttendance(
      List<UpdateEmployeeAttendanceRequest>
          updateEmployeeAttendanceRequestList) async {
    try {
      isLoading(true);
      final employeesData =
          await employeeRepository.updateDailyRouteEmployeeAttendance(
              updateEmployeeAttendanceRequestList);
      employeesData.fold(
        (data) {
          Helper.console('Success updated');
          getEmployees();
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void filterEmployees() {
    presentEmployees(employees
        .where((employee) => employee.status == EmployeeAttendance.PRESENT)
        .toList());
    absentEmployees(employees
        .where((employee) => employee.status == EmployeeAttendance.ABSENT)
        .toList());
    lateEmployees(employees
        .where((employee) => employee.status == EmployeeAttendance.LATE)
        .toList());
    leaveEmployees(employees
        .where((employee) => employee.status == EmployeeAttendance.LEAVE)
        .toList());
    leaveEmployees(employees
        .where((employee) => employee.status == EmployeeAttendance.COMING)
        .toList());
  }

  bool isPageBlank() {
    return (isPresentSelected.value && presentEmployees.isNotEmpty) ||
        (isAbsentSelected.value && absentEmployees.isNotEmpty) ||
        (isLateSelected.value && lateEmployees.isNotEmpty) ||
        (isLeaveSelected.value && leaveEmployees.isNotEmpty) ||
        (isComingSelected.value && comingEmployees.isNotEmpty);
  }

  void updateFilter(RxBool filterValue, bool newValue) {
    filterValue.value = newValue;
  }

  @override
  void onInit() {
    getEmployees();

    super.onInit();
  }
}
