import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';
import '../vehicle.dart';
import 'daily_route_ferry_stop.dart';

class DailyRoute {
  String id;
  String baseRouteName;
  DateTime date;
  DailyRouteType routeType;
  Vehicle vehicle;
  List<DailyRouteFerryStop> ferryStops;
  DateTime startTime;
  DateTime endTime;
  bool isFail;
  String lastFerryStopId;

  DailyRoute({
    required this.id,
    required this.baseRouteName,
    required this.date,
    required this.routeType,
    required this.vehicle,
    required this.ferryStops,
    required this.startTime,
    required this.endTime,
    required this.isFail,
    required this.lastFerryStopId,
  });

  factory DailyRoute.fromJson(Map<String, dynamic> json) => DailyRoute(
        id: json["id"],
        baseRouteName: json["baseRouteName"],
        date: DateTime.parse(json["date"]),
        routeType: MethodUtil.stringToRouteType(json["routeType"]),
        vehicle: Vehicle.fromJson(json["vehicle"]),
        ferryStops: List<DailyRouteFerryStop>.from(
            json["ferryStops"].map((x) => DailyRouteFerryStop.fromJson(x))),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        isFail: json['isFail'],
        lastFerryStopId: json["lastFerryStopId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseRouteName": baseRouteName,
        "date": date.toIso8601String(),
        "routeType": MethodUtil.routeTypeToString(routeType),
        "vehicle": vehicle.toJson(),
        "ferryStops": List<dynamic>.from(ferryStops.map((x) => x.toJson())),
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "isFail": isFail,
        "lastFerryStopId": lastFerryStopId,
      };
}
