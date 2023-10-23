import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/models/profile.dart';

// ignore: must_be_immutable
class GiftMessage extends Message {
  /// Creates a custom message.
  GiftMessage({
    super.datex,
    required super.id,
    this.gift,
    super.fromUser,
    super.room,
    super.toUser,
    super.user,
    super.userId,
    required this.text,
    MessageType? type,
  }) : super(type: type?.toString() ?? "4");

  /// Creates a custom message from a map (decoded JSON).
  factory GiftMessage.fromJson(Map<String, dynamic> json) {
    return GiftMessage(
      datex: json["datex"],
      fromUser: json["from_user"],
      id: json["id"],
      text: json["text"],
      room: json["room"],
      toUser: json["to_user"],
      type: json["type"],
      user: json["user"] == null ? null : Profile.fromJson(json["user"]),
      userId: json["user_id"],
    );
  }

  /// System message content (could be text or translation key).
  final String text;
  final Gift? gift;

  /// Equatable props.
  @override
  List<Object?> get props => [
        id,
        text,
      ];

  /// Converts a custom message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => {};

  Message copyWith() {
    throw UnimplementedError();
  }
}
