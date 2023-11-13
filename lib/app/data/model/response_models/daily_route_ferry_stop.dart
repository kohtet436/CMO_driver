import '../daily_route_employee.dart';

class DailyRouteFerryStop {
  DailyRouteFerryStop({
    required this.id,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMmName,
    required this.roadName,
    required this.roadMmName,
    required this.townshipName,
    required this.townshipMmName,
    required this.checkInTime,
    required this.checkOutTime,
    required this.sequenceNumber,
    required this.isCurrent,
    required this.employees,
  });

  String id;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;
  String roadName;
  String roadMmName;
  String townshipName;
  String townshipMmName;
  DateTime checkInTime;
  DateTime checkOutTime;
  int sequenceNumber;
  bool isCurrent;
  List<DailyRouteEmployee> employees;

  factory DailyRouteFerryStop.fromJson(Map<String, dynamic> json) =>
      DailyRouteFerryStop(
        id: json["id"],
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
        roadName: json["roadName"],
        roadMmName: json["roadMmName"],
        townshipName: json["townshipName"],
        townshipMmName: json["townshipMmName"],
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        checkInTime: DateTime.parse(json["checkInTime"]),
        sequenceNumber: json["sequenceNumber"],
        isCurrent: json['isCurrent'],
        employees: List<DailyRouteEmployee>.from(
            json["employees"].map((x) => DailyRouteEmployee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
        "roadName": roadName,
        "roadMmName": roadMmName,
        "townshipName": townshipName,
        "townshipMmName": townshipMmName,
        "checkInTime": checkInTime.toIso8601String(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "sequenceNumber": sequenceNumber,
        "isCurrent": isCurrent,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}
