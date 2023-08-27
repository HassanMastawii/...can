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
      "email": email,
      "password": password,
    };
  }

  User copy() {
    return User.fromJson(toJson());
  }

  String toQuery() {
    return "email=$email&password=$password";
  }
}

class Profile extends Equatable {
  int? id;
  int? roomId;
  String? name;
  String? email;
  String? pic;
  String? bio;
  String? contry;
  String? gender;
  int? balance;
  int? familyId;
  String? pic1;
  String? pic2;
  String? pic3;
  String? pic4;
  String? pic5;
  String? frind;
  // DateTime? birthday;
  // DateTime? created_at;
  // DateTime? updated_at;
  // DateTime? email_verified_at;

  Profile({
    this.email,
    this.balance,
    this.bio,
    this.contry,
    this.familyId,
    this.frind,
    this.gender,
    this.id,
    this.name,
    this.pic,
    this.pic1,
    this.pic2,
    this.pic3,
    this.pic4,
    this.pic5,
    this.roomId,
  });
  @override
  List<Object?> get props => [];

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json["email"],
      balance: json["balance"],
      bio: json["bio"],
      contry: json["contry"],
      familyId: json["family_id"],
      frind: json["frind"],
      gender: json["gender"],
      id: json["id"],
      name: json["name"],
      pic: json["pic"],
      pic1: json["pic1"],
      pic2: json["pic2"],
      pic3: json["pic3"],
      pic4: json["pic4"],
      pic5: json["pic5"],
      roomId: json["room_id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "balance": balance,
      "bio": bio,
      "contry": contry,
      "family_id": familyId,
      "frind": frind,
      "gender": gender,
      "id": id,
      "name": name,
      "pic": pic,
      "pic1": pic1,
      "pic2": pic2,
      "pic3": pic3,
      "pic4": pic4,
      "pic5": pic5,
      "room_id": roomId,
    };
  }

  User copy() {
    return User.fromJson(toJson());
  }
}
