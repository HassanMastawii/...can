import 'package:canary_app/domain/models/profile.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Message extends Equatable {
  int? id;
  int? userId;
  String? message;
  String? type;
  String? datex;
  String? fromUser;
  String? toUser;
  String? room;
  Profile? user;

  Message({
    this.datex,
    this.fromUser,
    this.id,
    this.message,
    this.room,
    this.toUser,
    this.type,
    this.user,
    this.userId,
  });
  @override
  List<Object?> get props => [];

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      datex: json["datex"],
      fromUser: json["from_user"],
      id: json["id"],
      message: json["message"],
      room: json["room"],
      toUser: json["to_user"],
      type: json["type"],
      user: json["user"] == null ? null : Profile.fromJson(json["user"]),
      userId: json["user_id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "datex": datex,
      "from_user": fromUser,
      "id": id,
      "message": message,
      "room": room,
      "to_user": toUser,
      "type": type,
      "user": user?.toJson(),
      "user_id": userId,
    };
  }

  Message copy() {
    return Message.fromJson(toJson());
  }
}
