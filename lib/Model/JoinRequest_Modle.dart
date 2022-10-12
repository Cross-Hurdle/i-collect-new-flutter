// To parse this JSON data, do
//
//     final joinRequestDataResponse = joinRequestDataResponseFromJson(jsonString);

import 'dart:convert';

JoinRequestDataResponse joinRequestDataResponseFromJson(String str) => JoinRequestDataResponse.fromJson(json.decode(str));

String joinRequestDataResponseToJson(JoinRequestDataResponse data) => json.encode(data.toJson());

class JoinRequestDataResponse {
    JoinRequestDataResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory JoinRequestDataResponse.fromJson(Map<String, dynamic> json) => JoinRequestDataResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
