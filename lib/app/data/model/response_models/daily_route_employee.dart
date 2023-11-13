import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';

class DailyRouteEmployee {
  String employeeId;
  String employeeName;
  String phoneNumber;
  String department;
  String photoPath;
  EmployeeAttendance status;
  DateTime checkInTime;
  DateTime checkOutTime;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;

  DailyRouteEmployee({
    required this.employeeId,
    required this.employeeName,
    required this.department,
    required this.phoneNumber,
    required this.photoPath,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMmName,
    required this.checkInTime,
    required this.checkOutTime,
    required this.status,
  });

  factory DailyRouteEmployee.fromJson(Map<String, dynamic> json) =>
      DailyRouteEmployee(
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        department: json["department"],
        phoneNumber: json["phoneNumber"],
        photoPath: json["photoPath"] ?? '',
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
        checkInTime: DateTime.parse(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        status: MethodUtil.stringToEmployeeAttendance(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeName": employeeName,
        "department": department,
        "phoneNumber": phoneNumber,
        "photoPath": photoPath,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
        "checkInTime": checkInTime.toIso8601String(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "status": MethodUtil.employeeAttendanceToString(status),
      };
}
