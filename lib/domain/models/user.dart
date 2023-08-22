import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  String? email;
  String? password;

  User({
    this.email,
    this.password,
  });
  @override
  List<Object?> get props => [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "email": email,
    };
  }

  User copy() {
    return User(
      password: password,
      email: email,
    );
  }
}
