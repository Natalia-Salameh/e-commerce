import 'dart:convert';

import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel extends SignUpEntity{

    SignUpModel({
        required String email,
        required String name,
        required String password,
        required String role,
        required String avatar,
    }) : super(email: email, name: name, password: password, role: role, avatar: avatar);

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        role: json["role"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "role": role,
        "avatar": avatar,
    };
}
