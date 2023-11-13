import 'employee.dart';
import 'ferry_stop.dart';

class BaseRouteFerryStop {
  String id;
  String ferryStopId;
  FerryStop ferryStop;
  int sequenceNumber;
  List<Employee> employees;

  BaseRouteFerryStop({
    required this.id,
    required this.ferryStopId,
    required this.ferryStop,
    required this.sequenceNumber,
    required this.employees,
  });

  factory BaseRouteFerryStop.fromJson(Map<String, dynamic> json) =>
      BaseRouteFerryStop(
        id: json["id"],
        ferryStopId: json["ferryStopId"],
        ferryStop: FerryStop.fromJson(json['ferryStop']),
        sequenceNumber: json["sequenceNumber"],
        employees: List<Employee>.from(
            json["employees"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ferryStopId": ferryStopId,
        "ferryStops": ferryStop.toJson(),
        "sequenceNumber": sequenceNumber,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}
