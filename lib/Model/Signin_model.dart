// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    SignInModel({
        required this.result,
        required this.message,
        required this.userData,
        required this.token,
    });

    bool result;
    String message;
    UserData userData;
    String token;

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        result: json["result"],
        message: json["message"],
        userData: UserData.fromJson(json["user_data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "user_data": userData.toJson(),
        "token": token,
    };
}

class UserData {
    UserData({
        required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.phone,
        required this.verificationCode,
        required this.status,
        this.providerId,
        this.emailVerifiedAt,
    });

    var id;
    String email;
    String password;
    String name;
    String phone;
    String verificationCode;
    String status;
    dynamic providerId;
    dynamic emailVerifiedAt;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        phone: json["phone"],
        verificationCode: json["verification_code"],
        status: json["status"],
        providerId: json["provider_id"],
        emailVerifiedAt: json["email_verified_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "verification_code": verificationCode,
        "status": status,
        "provider_id": providerId,
        "email_verified_at": emailVerifiedAt,
    };
}
