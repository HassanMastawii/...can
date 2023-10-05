class Background {
  final int id;
  final String name;
  final String src;
  final String det;
  final int status;
  final int price;
  final String date;

  Background({
    required this.id,
    required this.name,
    required this.src,
    required this.det,
    required this.status,
    required this.price,
    required this.date,
  });
  factory Background.fromJson(Map<String, dynamic> json) {
    return Background(
      id: json["id"],
      name: json["name"],
      src: json["src"],
      det: json["det"],
      status: json["status"],
      price: json["price"],
      date: json["date"],
    );
  }
}
