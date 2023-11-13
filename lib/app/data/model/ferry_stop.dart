import 'road.dart';
import 'township.dart';

class FerryStop {
  FerryStop({
    required this.id,
    required this.name,
    required this.myanmarName,
    required this.roadId,
    required this.road,
    required this.townshipId,
    required this.township,
  });

  String id;
  String name;
  String myanmarName;
  String roadId;
  Road road;
  String townshipId;
  Township township;

  factory FerryStop.fromJson(Map<String, dynamic> json) => FerryStop(
        id: json["id"],
        name: json["name"],
        myanmarName: json["myanmarName"],
        roadId: json['roadId'],
        road: Road.fromJson(json["road"]),
        townshipId: json['townshipId'],
        township: Township.fromJson(json["township"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "myanmarName": myanmarName,
        "roadId": roadId,
        "road": road.toJson(),
        "townshipId": townshipId,
        "township": township.toJson(),
      };

  @override
  bool operator ==(Object other) {
    FerryStop ferryStop = other as FerryStop;
    return ((id == ferryStop.id) &&
        (name == ferryStop.name) &&
        (myanmarName == ferryStop.myanmarName) &&
        (road == ferryStop.road) &&
        (township == ferryStop.township));
  }

  @override
  int get hashCode => Object.hash(id, name, myanmarName, road, township);
}
