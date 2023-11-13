class DriverLeaveRequest {
  String vehicleEmployeeId;
  String reason;
  DateTime startDate;
  DateTime endDate;

  DriverLeaveRequest({
    required this.vehicleEmployeeId,
    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  factory DriverLeaveRequest.fromJson(Map<String, dynamic> json) =>
      DriverLeaveRequest(
        vehicleEmployeeId: json["vehicleEmployeeId"],
        reason: json["reason"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "vehicleEmployeeId": vehicleEmployeeId,
        "reason": reason,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
