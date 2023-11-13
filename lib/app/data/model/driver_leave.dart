class DriverLeave {
  String id;
  String vehicleEmployeeId;
  String vehicleEmployeeName;
  String reason;
  DateTime startDate;
  DateTime endDate;
  String leaveStatus;

  DriverLeave({
    required this.id,
    required this.vehicleEmployeeId,
    required this.vehicleEmployeeName,
    required this.reason,
    required this.startDate,
    required this.endDate,
    required this.leaveStatus,
  });

  factory DriverLeave.fromJson(Map<String, dynamic> json) => DriverLeave(
        id: json["id"],
        vehicleEmployeeId: json["vehicleEmployeeId"],
        vehicleEmployeeName: json["vehicleEmployeeName"],
        reason: json["reason"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        leaveStatus: json["leaveStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicleEmployeeId": vehicleEmployeeId,
        "vehicleEmployeeName": vehicleEmployeeName,
        "reason": reason,
        "startDate": startDate.toString(),
        "endDate": endDate.toString(),
        "leaveStatus": leaveStatus,
      };
}
