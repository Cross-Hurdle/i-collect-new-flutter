// To parse this JSON data, do
//
//     final forgotpasswordResponse = forgotpasswordResponseFromJson(jsonString);

import 'dart:convert';

ForgotpasswordResponse forgotpasswordResponseFromJson(String str) => ForgotpasswordResponse.fromJson(json.decode(str));

String forgotpasswordResponseToJson(ForgotpasswordResponse data) => json.encode(data.toJson());

class ForgotpasswordResponse {
    ForgotpasswordResponse({
        required this.result,
        required this.message,
        required this.id,
        required this.verificationCode,
    });

    bool result;
    String message;
    int id;
    String verificationCode;

    factory ForgotpasswordResponse.fromJson(Map<String, dynamic> json) => ForgotpasswordResponse(
        result: json["result"],
        message: json["message"],
        id: json["id"],
        verificationCode: json["verification_code"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "id": id,
        "verification_code": verificationCode,
    };
}
