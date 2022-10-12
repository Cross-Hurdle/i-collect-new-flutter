// To parse this JSON data, do
//
//     final dobResponse = dobResponseFromJson(jsonString);

import 'dart:convert';

DobResponse dobResponseFromJson(String str) => DobResponse.fromJson(json.decode(str));

String dobResponseToJson(DobResponse data) => json.encode(data.toJson());

class DobResponse {
    DobResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory DobResponse.fromJson(Map<String, dynamic> json) => DobResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
