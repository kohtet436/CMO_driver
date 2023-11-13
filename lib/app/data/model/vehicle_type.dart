class VehicleType {
  VehicleType({
    required this.id,
    required this.model,
    required this.numberOfSeats,
  });

  final String id;
  final String model;
  final int numberOfSeats;

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        id: json["id"],
        model: json["model"],
        numberOfSeats: json["numberOfSeats"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model": model,
        "numberOfSeats": numberOfSeats,
      };
}
