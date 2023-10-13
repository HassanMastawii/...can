import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Gift extends Equatable {
  final int id;
  final String name;
  final int baner;
  final String pic;
  final String src;
  final int type;
  final int formatType;
  final String format;
  final int timeOfGift;
  final int status;
  final int price;
  final int? worker;
  final int? des;
  final DateTime date;
  final DateTime updateAt;

  const Gift(
      {required this.id,
      required this.name,
      required this.baner,
      required this.pic,
      required this.src,
      required this.type,
      required this.formatType,
      required this.format,
      required this.timeOfGift,
      required this.status,
      required this.price,
      required this.worker,
      required this.des,
      required this.date,
      required this.updateAt});

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      baner: int.parse(json["baner"].toString()),
      date: DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["date"]),
      id: json["id"],
      des: json["des"],
      format: json["format"],
      formatType: json["format_type"],
      type: int.parse(json["type"].toString()),
      name: json["name"],
      pic: json["pic"],
      price: int.parse(json["price"].toString()),
      src: json["src"],
      status: json["status"],
      timeOfGift: json["time_of_gift"],
      updateAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["update_at"]),
      worker: json["worker"],
    );
  }
  Map<String, dynamic> toJson() {
    return {};
  }

  Gift copy() {
    return Gift.fromJson(toJson());
  }

  @override
  List<Object?> get props => [];
}
