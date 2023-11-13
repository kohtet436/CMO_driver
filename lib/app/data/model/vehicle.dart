import 'vehicle_type.dart';

class Vehicle {
  String id;
  String photoPath;
  VehicleType vehicleType;
  String color;
  String licensePlate;
  DateTime plateExpiredDate;
  String vehicleStatus;

  Vehicle({
    required this.id,
    required this.photoPath,
    required this.vehicleType,
    required this.color,
    required this.licensePlate,
    required this.plateExpiredDate,
    required this.vehicleStatus,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        photoPath: json["photoPath"] ?? '',
        vehicleType: VehicleType.fromJson(json["vehicleType"]),
        color: json["color"],
        licensePlate: json["licensePlate"],
        plateExpiredDate: DateTime.parse(json["plateExpiredDate"]),
        vehicleStatus: json["vehicleStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photoPath": photoPath,
        "vehicleType": vehicleType.toJson(),
        "color": color,
        "licensePlate": licensePlate,
        "plateExpiredDate": plateExpiredDate.toString(),
        "vehicleStatus": vehicleStatus,
      };
}
