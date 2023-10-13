import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserCoin extends Equatable {
  final int userId;
  final String username;
  final String userPic;
  final int totalCoinAmount;

  const UserCoin({
    required this.userId,
    required this.userPic,
    required this.totalCoinAmount,
    required this.username,
  });
  @override
  List<Object?> get props => [];

  factory UserCoin.fromJson(Map<String, dynamic> json) {
    return UserCoin(
      userId: int.parse(json["user_id"].toString()),
      userPic: json["user_pic"],
      totalCoinAmount: json["total_coin_amount"],
      username: json["username"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "user_pic": userPic,
      "total_coin_amount": totalCoinAmount,
      "username": username,
    };
  }

  UserCoin copy() {
    return UserCoin.fromJson(toJson());
  }
}
