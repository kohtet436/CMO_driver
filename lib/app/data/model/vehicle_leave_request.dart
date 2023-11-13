class VehicleLeaveRequest {
  String vehicleId;
  String reason;
  DateTime startDate;
  DateTime endDate;

  VehicleLeaveRequest({
    required this.vehicleId,
    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  factory VehicleLeaveRequest.fromJson(Map<String, dynamic> json) =>
      VehicleLeaveRequest(
        vehicleId: json["vehicleId"],
        reason: json["reason"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "vehicleId": vehicleId,
        "reason": reason,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
