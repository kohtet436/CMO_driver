class Employee {
  String employeeId;
  String employeeNumber;
  String department;
  String name;
  String phoneNumber;
  String photoPath;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;
  String roadName;
  String roadMmName;
  String townshipName;
  String townshipMmName;

  Employee({
    required this.employeeId,
    required this.employeeNumber,
    required this.department,
    required this.name,
    required this.phoneNumber,
    required this.photoPath,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMmName,
    required this.roadName,
    required this.roadMmName,
    required this.townshipName,
    required this.townshipMmName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["employeeId"],
        employeeNumber: json["employeeNumber"],
        department: json["department"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        photoPath: json["photoPath"] ?? '',
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
        roadName: json["roadName"],
        roadMmName: json["roadMmName"],
        townshipName: json["townshipName"],
        townshipMmName: json["townshipMmName"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeNumber": employeeNumber,
        "department": department,
        "name": name,
        "phoneNumber": phoneNumber,
        "photoPath": photoPath,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
        "roadName": roadName,
        "roadMmName": roadMmName,
        "townshipName": townshipName,
        "townshipMmName": townshipMmName,
      };
}
