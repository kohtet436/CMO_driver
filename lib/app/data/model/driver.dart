class Driver {
  String id;
  String vehicleEmployeeNumber;
  String name;
  String email;
  String address;
  String nrc;
  String phoneNumber;
  DateTime dateOfBirth;
  String photoPath;
  String gender;
  String licenseNumber;
  String licenseColor;
  DateTime licenseCardExpiredDate;
  String assignedVehicleId;
  String vehicleEmployeeStatus;

  Driver({
    required this.id,
    required this.vehicleEmployeeNumber,
    required this.name,
    required this.email,
    required this.address,
    required this.nrc,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.photoPath,
    required this.gender,
    required this.licenseNumber,
    required this.licenseColor,
    required this.licenseCardExpiredDate,
    required this.assignedVehicleId,
    required this.vehicleEmployeeStatus,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        vehicleEmployeeNumber: json["vehicleEmployeeNumber"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        nrc: json["nrc"],
        phoneNumber: json["phoneNumber"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        photoPath: json["photoPath"] ?? '',
        gender: json["gender"],
        licenseNumber: json["licenseNumber"],
        licenseColor: json["licenseColor"],
        licenseCardExpiredDate: DateTime.parse(json["licenseCardExpiredDate"]),
        assignedVehicleId: json["assignedVehicleId"],
        vehicleEmployeeStatus: json["vehicleEmployeeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicleEmployeeNumber": vehicleEmployeeNumber,
        "name": name,
        "email": email,
        "address": address,
        "nrc": nrc,
        "phoneNumber": phoneNumber,
        "dateOfBirth": dateOfBirth.toString(),
        "photoPath": photoPath,
        "gender": gender,
        "licenseNumber": licenseNumber,
        "licenseColor": licenseColor,
        "licenseCardExpiredDate": licenseCardExpiredDate.toString(),
        "assignedVehicleId": assignedVehicleId,
        "vehicleEmployeeStatus": vehicleEmployeeStatus,
      };
}
