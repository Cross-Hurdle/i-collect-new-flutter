// To parse this JSON data, do
//
//     final fcmTokenResponse = fcmTokenResponseFromJson(jsonString);

import 'dart:convert';

FcmTokenResponse fcmTokenResponseFromJson(String str) => FcmTokenResponse.fromJson(json.decode(str));

String fcmTokenResponseToJson(FcmTokenResponse data) => json.encode(data.toJson());

class FcmTokenResponse {
    FcmTokenResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory FcmTokenResponse.fromJson(Map<String, dynamic> json) => FcmTokenResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
