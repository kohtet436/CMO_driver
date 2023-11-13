class RouteStartEndRequest {
  String vehicleEmployeeId;
  String dailyRouteId;

  RouteStartEndRequest({
    required this.vehicleEmployeeId,
    required this.dailyRouteId,
  });

  factory RouteStartEndRequest.fromJson(Map<String, dynamic> json) =>
      RouteStartEndRequest(
        vehicleEmployeeId: json['vehicleEmployeeId'],
        dailyRouteId: json['dailyRouteId'],
      );

  Map<String, dynamic> toJson() {
    return {
      'vehicleEmployeeId': vehicleEmployeeId,
      'dailyRouteId': dailyRouteId,
    };
  }
}
