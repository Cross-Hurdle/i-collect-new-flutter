// To parse this JSON data, do
//
//     final userAlreadyExistModel = userAlreadyExistModelFromJson(jsonString);

import 'dart:convert';

UserAlreadyExistModel userAlreadyExistModelFromJson(String str) => UserAlreadyExistModel.fromJson(json.decode(str));

String userAlreadyExistModelToJson(UserAlreadyExistModel data) => json.encode(data.toJson());

class UserAlreadyExistModel {
    UserAlreadyExistModel({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory UserAlreadyExistModel.fromJson(Map<String, dynamic> json) => UserAlreadyExistModel(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
