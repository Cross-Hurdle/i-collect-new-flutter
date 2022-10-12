// To parse this JSON data, do
//
//     final emailAlreadyExistResponse = emailAlreadyExistResponseFromJson(jsonString);

import 'dart:convert';

EmailAlreadyExistResponse emailAlreadyExistResponseFromJson(String str) => EmailAlreadyExistResponse.fromJson(json.decode(str));

String emailAlreadyExistResponseToJson(EmailAlreadyExistResponse data) => json.encode(data.toJson());

class EmailAlreadyExistResponse {
    EmailAlreadyExistResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory EmailAlreadyExistResponse.fromJson(Map<String, dynamic> json) => EmailAlreadyExistResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
