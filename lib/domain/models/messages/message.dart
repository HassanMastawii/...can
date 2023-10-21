import 'package:canary_app/domain/models/messages/gift_message.dart';
import 'package:canary_app/domain/models/messages/system_message.dart';
import 'package:canary_app/domain/models/messages/text_message.dart';
import 'package:canary_app/domain/models/profile.dart';
import 'package:equatable/equatable.dart';

enum MessageType {
  gift,
  system,
  text,
}

// ignore: must_be_immutable
abstract class Message extends Equatable {
  int? id;
  int? userId;

  /// ```dart
  /// 1 for text
  /// 2 for voice
  /// 3 for images
  /// 4 for gift
  /// 5 for system
  /// ```
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
    this.room,
    this.toUser,
    this.type,
    this.user,
    this.userId,
  });
  @override
  List<Object?> get props => [];

  factory Message.fromJson(Map<String, dynamic> json) {
    final type = MessageType.values.firstWhere(
      (e) => e.name == json['type'],
    );

    switch (type) {
      case MessageType.gift:
        return GiftMessage.fromJson(json);
      case MessageType.system:
        return SystemMessage.fromJson(json);
      case MessageType.text:
        return TextMessage.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "datex": datex,
      "from_user": fromUser,
      "id": id,
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
