import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';

class UpdateEmployeeAttendanceRequest {
  String employeeId;
  String dailyRouteId;
  EmployeeAttendance status;

  UpdateEmployeeAttendanceRequest({
    required this.employeeId,
    required this.dailyRouteId,
    required this.status,
  });

  factory UpdateEmployeeAttendanceRequest.fromJson(Map<String, dynamic> json) =>
      UpdateEmployeeAttendanceRequest(
        employeeId: json['employeeId'],
        dailyRouteId: json['dailyRouteId'],
        status: MethodUtil.stringToEmployeeAttendance(json['status']),
      );

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'dailyRouteId': dailyRouteId,
      'status': MethodUtil.employeeAttendanceToString(status),
    };
  }
}
