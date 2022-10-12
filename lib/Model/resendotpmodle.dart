// To parse this JSON data, do
//
//     final resendOtpResponse = resendOtpResponseFromJson(jsonString);

import 'dart:convert';

ResendOtpResponse resendOtpResponseFromJson(String str) => ResendOtpResponse.fromJson(json.decode(str));

String resendOtpResponseToJson(ResendOtpResponse data) => json.encode(data.toJson());

class ResendOtpResponse {
    ResendOtpResponse({
        required this.result,
        required this.message,
        required this.id,
        required this.verificationCode,
    });

    bool result;
    String message;
    int id;
    String verificationCode;

    factory ResendOtpResponse.fromJson(Map<String, dynamic> json) => ResendOtpResponse(
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
