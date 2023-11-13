import '../../core/helper/app_enum.dart';
import '../../core/util/method_util.dart';

class DailyRouteEmployee {
  String employeeId;
  String employeeName;
  String dailyRouteId;
  EmployeeAttendance status;
  String ferryStopDailyRouteId;
  DateTime checkInTime;
  DateTime checkOutTime;
  String photoPath;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;

  DailyRouteEmployee({
    required this.employeeId,
    required this.employeeName,
    required this.dailyRouteId,
    required this.status,
    required this.ferryStopDailyRouteId,
    required this.checkInTime,
    required this.checkOutTime,
    required this.photoPath,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMmName,
  });

  factory DailyRouteEmployee.fromJson(Map<String, dynamic> json) =>
      DailyRouteEmployee(
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        dailyRouteId: json["dailyRouteId"],
        status: MethodUtil.stringToEmployeeAttendance(
          json["status"],
          checkInTime: json["checkInTime"],
        ),
        ferryStopDailyRouteId: json["ferryStopDailyRouteId"],
        checkInTime: DateTime.parse(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        photoPath: json["photoPath"] ?? '',
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeName": employeeName,
        "dailyRouteId": dailyRouteId,
        "status": MethodUtil.employeeAttendanceToString(status),
        "ferryStopDailyRouteId": ferryStopDailyRouteId,
        "checkInTime": checkInTime.toString(),
        "checkOutTime": checkOutTime.toString(),
        "photoPath": photoPath,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
      };
}
