import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    String email;
    String name;
    String password;
    String role;
    String avatar;

    SignUpModel({
        required this.email,
        required this.name,
        required this.password,
        required this.role,
        required this.avatar,
    });

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
