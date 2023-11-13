class DriverUpdateProfile {
  String id;
  String phoneNumber;
  String address;

  DriverUpdateProfile({
    required this.id,
    required this.phoneNumber,
    required this.address,
  });

  factory DriverUpdateProfile.fromJson(Map<String, dynamic> json) =>
      DriverUpdateProfile(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
