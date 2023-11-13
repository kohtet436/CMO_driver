import 'employee.dart';
import 'base_route_ferry_stop.dart';
import 'vehicle.dart';

class BaseRoute {
  String id;
  String baseRouteName;
  List<BaseRouteFerryStop> ferryStops;
  List<Employee> employees = [];
  String vehicleId;
  Vehicle vehicle;

  BaseRoute({
    required this.id,
    required this.baseRouteName,
    required this.ferryStops,
    required this.vehicleId,
    required this.vehicle,
  });

  factory BaseRoute.fromJson(Map<String, dynamic> json) {
    final baseRoute = BaseRoute(
      id: json["id"],
      baseRouteName: json["baseRouteName"],
      ferryStops: List<BaseRouteFerryStop>.from(
          json["ferryStops"].map((x) => BaseRouteFerryStop.fromJson(x))),
      vehicleId: json['vehicleId'],
      vehicle: Vehicle.fromJson(json["vehicle"]),
    );

    for (BaseRouteFerryStop routeFerryStop in baseRoute.ferryStops) {
      baseRoute.employees.addAll(routeFerryStop.employees);
    }

    return baseRoute;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseRouteName": baseRouteName,
        "ferryStops": List<dynamic>.from(ferryStops.map((x) => x.toJson())),
        "vehicleId": vehicleId,
        "vehicle": vehicle.toJson(),
      };
}
