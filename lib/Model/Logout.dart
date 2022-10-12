// To parse this JSON data, do
//
//     final logoutresponse = logoutresponseFromJson(jsonString);

import 'dart:convert';

Logoutresponse logoutresponseFromJson(String str) => Logoutresponse.fromJson(json.decode(str));

String logoutresponseToJson(Logoutresponse data) => json.encode(data.toJson());

class Logoutresponse {
    Logoutresponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory Logoutresponse.fromJson(Map<String, dynamic> json) => Logoutresponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
