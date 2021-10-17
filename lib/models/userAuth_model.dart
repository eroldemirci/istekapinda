// To parse this JSON data, do
//
//     final userAuthModel = userAuthModelFromJson(jsonString);

import 'dart:convert';

UserAuthModel userAuthModelFromJson(String str) =>
    UserAuthModel.fromJson(json.decode(str));

String userAuthModelToJson(UserAuthModel data) => json.encode(data.toJson());

class UserAuthModel {
  UserAuthModel({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.tel,
    this.profilePhotoPath,
    this.state,
    this.telVerifiedAt,
    this.emailVerifiedAt,
    this.subscription,
    this.appNotify,
    this.smsNotify,
    this.mailNotify,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String lastname;
  String email;
  String tel;
  String profilePhotoPath;
  String state;
  dynamic telVerifiedAt;
  dynamic emailVerifiedAt;
  dynamic subscription;
  String appNotify;
  String smsNotify;
  String mailNotify;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        tel: json["tel"],
        profilePhotoPath: json["profile_photo_path"],
        state: json["state"],
        telVerifiedAt: json["tel_verified_at"],
        emailVerifiedAt: json["email_verified_at"],
        subscription: json["subscription"],
        appNotify: json["app_notify"],
        smsNotify: json["sms_notify"],
        mailNotify: json["mail_notify"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "tel": tel,
        "profile_photo_path": profilePhotoPath,
        "state": state,
        "tel_verified_at": telVerifiedAt,
        "email_verified_at": emailVerifiedAt,
        "subscription": subscription,
        "app_notify": appNotify,
        "sms_notify": smsNotify,
        "mail_notify": mailNotify,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
