import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Room extends Equatable {
  int? roomId;
  String? roomStatus;
  String? name;
  String? owner;
  String? moderators;
  String? contry;
  String? password;
  String? pic;
  String? background;
  String? micMain;
  String? defImgMainMic;
  int? status;

  Room({
    this.roomId,
    this.roomStatus,
    this.name,
    this.owner,
    this.moderators,
    this.contry,
    this.password,
    this.pic,
    this.background,
    this.micMain,
    this.defImgMainMic,
    this.status,
  });
  @override
  List<Object?> get props => [];

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json["name"],
      password: json["password"],
      contry: json["contry"],
      background: json["background"],
      defImgMainMic: json["def_img_main_mic"],
      micMain: json["mic_main"],
      moderators: json["moderators"],
      owner: json["owner"],
      pic: json["pic"],
      roomId: int.parse(json["room_id"].toString()),
      roomStatus: json["room_status"],
      status: int.parse(json["status"].toString()),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "password": password,
      "contry": contry,
      "background": background,
      "def_img_main_mic": defImgMainMic,
      "mic_main": micMain,
      "moderators": moderators,
      "owner": owner,
      "pic": pic,
      "room_id": roomId,
      "room_status": roomStatus,
      "status": status,
    };
  }

  Room copy() {
    return Room.fromJson(toJson());
  }

  String createRoomQuery() {
    return "password=$password&name=$name";
  }
}
