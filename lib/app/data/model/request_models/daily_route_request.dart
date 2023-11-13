import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';

class DailyRouteRequest {
  String baseRouteId;
  DateTime date;
  DailyRouteType routeType;

  DailyRouteRequest({
    required this.baseRouteId,
    required this.date,
    required this.routeType,
  });

  factory DailyRouteRequest.fromJson(Map<String, dynamic> json) =>
      DailyRouteRequest(
        baseRouteId: json["baseRouteId"],
        date: DateTime.parse(json["date"]),
        routeType: MethodUtil.stringToRouteType(json["routeType"]),
      );

  Map<String, dynamic> toJson() {
    return {
      "baseRouteId": baseRouteId,
      "date": date.toIso8601String(),
      "routeType": MethodUtil.routeTypeToString(routeType),
    };
  }
}
