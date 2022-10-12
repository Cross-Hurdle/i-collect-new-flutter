// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        required this.result,
        required this.message,
        required this.userData,
    });

    bool result;
    String message;
    UserData userData;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        result: json["result"],
        message: json["message"],
        userData: UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "user_data": userData.toJson(),
    };
}

class UserData {
    UserData({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.verificationCode,
        required this.status,
    });

    int id;
    String name;
    String email;
    String phone;
    String password;
    int verificationCode;
    int status;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        verificationCode: json["verification_code"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "verification_code": verificationCode,
        "status": status,
    };
}
