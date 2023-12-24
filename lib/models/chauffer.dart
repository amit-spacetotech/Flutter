class Chauffer {
  final String id;
  final String name;

  Chauffer({required this.id, required this.name});
  factory Chauffer.fromJson(Map<String, dynamic> json) {
    return Chauffer(id: json['_id'], name: json['driverName']);
  }
}
