class VehicleLeave {
  String id;
  String vehicleId;
  String vehicleLicensePlate;
  String reason;
  DateTime startDate;
  DateTime endDate;
  String leaveStatus;

  VehicleLeave({
    required this.id,
    required this.vehicleId,
    required this.vehicleLicensePlate,
    required this.reason,
    required this.startDate,
    required this.endDate,
    required this.leaveStatus,
  });

  factory VehicleLeave.fromJson(Map<String, dynamic> json) => VehicleLeave(
        id: json["id"],
        vehicleId: json["vehicleId"],
        vehicleLicensePlate: json["vehicleLicensePlate"],
        reason: json["reason"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        leaveStatus: json["leaveStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicleId": vehicleId,
        "vehicleLicensePlate": vehicleLicensePlate,
        "reason": reason,
        "startDate": startDate.toString(),
        "endDate": endDate.toString(),
        "leaveStatus": leaveStatus,
      };
}
