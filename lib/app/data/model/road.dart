class Road {
  String id;
  String name;
  String myanmarName;

  Road({
    required this.id,
    required this.name,
    required this.myanmarName,
  });

  factory Road.fromJson(Map<String, dynamic> json) => Road(
        id: json["id"],
        name: json["name"],
        myanmarName: json["myanmarName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "myanmarName": myanmarName,
      };

  @override
  bool operator ==(Object other) {
    Road road = other as Road;
    return ((id == road.id) &&
        (name == road.name) &&
        (myanmarName == road.myanmarName));
  }

  @override
  int get hashCode => Object.hash(id, name, myanmarName);
}
