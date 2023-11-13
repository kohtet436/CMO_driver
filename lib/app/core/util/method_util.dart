import '../helper/constant.dart';
import '../helper/app_enum.dart';
import '../values/strings_manager.dart';

class MethodUtil {
  static EmployeeAttendance stringToEmployeeAttendance(
    String status, {
    String checkInTime = '',
  }) {
    final String upperCaseStatus = status.toUpperCase();
    switch (upperCaseStatus) {
      case "LEAVE":
        return EmployeeAttendance.LEAVE;
      case "PRESENT":
        return EmployeeAttendance.PRESENT;
      case "ABSENT":
        if (DateTime.parse(checkInTime) == DateTime.parse(DEFAULT_TIME)) {
          return EmployeeAttendance.COMING;
        } else {
          return EmployeeAttendance.ABSENT;
        }
      case "LATE":
        return EmployeeAttendance.LATE;
      default:
        throw Exception('Unknown status');
    }
  }

  static String employeeAttendanceToString(
      EmployeeAttendance employeeAttendance) {
    switch (employeeAttendance) {
      case EmployeeAttendance.LEAVE:
        return AppStrings.leave;
      case EmployeeAttendance.PRESENT:
        return AppStrings.present;
      case EmployeeAttendance.ABSENT:
        return AppStrings.absent;
      case EmployeeAttendance.LATE:
        return AppStrings.late;
      case EmployeeAttendance.COMING:
        return AppStrings.coming;
    }
  }

  static DailyRouteType stringToRouteType(String routeType) {
    final String routeTypeUpper = routeType.toUpperCase();
    switch (routeTypeUpper) {
      case "MORNING":
        return DailyRouteType.MORNING;
      case "EVENING":
        return DailyRouteType.EVENING;
      default:
        throw throw Exception('Unknown route type');
    }
  }

  static String routeTypeToString(DailyRouteType routeType) {
    switch (routeType) {
      case DailyRouteType.MORNING:
        return AppStrings.morning;
      case DailyRouteType.EVENING:
        return AppStrings.evening;
    }
  }
}
