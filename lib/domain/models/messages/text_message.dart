import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/models/profile.dart';

// ignore: must_be_immutable
class TextMessage extends Message {
  /// Creates a text message.
  TextMessage({
    super.datex,
    required super.id,
    super.fromUser,
    super.room,
    super.toUser,
    super.user,
    super.userId,
    required this.message,
    MessageType? type,
  }) : super(type: type?.index.toString() ?? "1");

  factory TextMessage.fromJson(Map<String, dynamic> json) {
    return TextMessage(
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

  /// User's message.
  final String message;

  /// Equatable props.
  @override
  List<Object?> get props => [
        id,
        message,
      ];

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "name": fromUser,
        "dateTime": datex,
      };

  Message copyWith() {
    return TextMessage(
      id: id,
      message: message,
    );
  }

  String postQuery() {
    return "from_user=$fromUser&to_user=$toUser&room_id=$room&type=$type&message=$message";
  }
}
