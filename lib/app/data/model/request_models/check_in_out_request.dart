class CheckInOutRequest {
  String vehicleEmployeeId;
  String dailyRouteId;
  String ferryStopId;

  CheckInOutRequest({
    required this.vehicleEmployeeId,
    required this.dailyRouteId,
    required this.ferryStopId,
  });

  factory CheckInOutRequest.fromJson(Map<String, dynamic> json) =>
      CheckInOutRequest(
        vehicleEmployeeId: json['vehicleEmployeeId'],
        dailyRouteId: json['dailyRouteId'],
        ferryStopId: json['ferryStopId'],
      );

  Map<String, dynamic> toJson() {
    return {
      'vehicleEmployeeId': vehicleEmployeeId,
      'dailyRouteId': dailyRouteId,
      'ferryStopId': ferryStopId,
    };
  }
}
