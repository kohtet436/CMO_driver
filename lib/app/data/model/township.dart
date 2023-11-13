class Township {
  String id;
  String name;
  String myanmarName;

  Township({
    required this.id,
    required this.name,
    required this.myanmarName,
  });

  factory Township.fromJson(Map<String, dynamic> json) => Township(
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
    Township road = other as Township;
    return ((id == road.id) &&
        (name == road.name) &&
        (myanmarName == road.myanmarName));
  }

  @override
  int get hashCode => Object.hash(id, name, myanmarName);
}
