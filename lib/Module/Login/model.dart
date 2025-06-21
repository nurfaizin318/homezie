// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String id;
    String name;
    String email;
    String phoneNumber;
    dynamic profilePicture;
    dynamic address;
    String accessToken;

    LoginModel({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.profilePicture,
        required this.address,
        required this.accessToken,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        profilePicture: json["profile_picture"],
        address: json["address"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "profile_picture": profilePicture,
        "address": address,
        "access_token": accessToken,
    };
}
