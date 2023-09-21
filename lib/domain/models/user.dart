import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  String? name;
  String? email;
  String? password;
  String? contry;
  int? gender;

  User({
    this.email,
    this.password,
    this.name,
    this.contry,
    this.gender,
  });
  @override
  List<Object?> get props => [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      name: json["name"],
      password: json["password"],
      contry: json["contry"],
      gender: json["gender"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "contry": contry,
      "gender": gender,
    };
  }

  User copy() {
    return User.fromJson(toJson());
  }

  String toQuery() {
    return "email=$email&password=$password&name=$name&contry=$contry&gender=$gender";
  }
}
