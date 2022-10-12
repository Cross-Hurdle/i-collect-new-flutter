// To parse this JSON data, do
//
//     final inviteDataResponse = inviteDataResponseFromJson(jsonString);

import 'dart:convert';

InviteDataResponse inviteDataResponseFromJson(String str) => InviteDataResponse.fromJson(json.decode(str));

String inviteDataResponseToJson(InviteDataResponse data) => json.encode(data.toJson());

class InviteDataResponse {
    InviteDataResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory InviteDataResponse.fromJson(Map<String, dynamic> json) => InviteDataResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
