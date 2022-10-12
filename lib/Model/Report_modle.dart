// To parse this JSON data, do
//
//     final reportresponse = reportresponseFromJson(jsonString);

import 'dart:convert';

Reportresponse reportresponseFromJson(String str) => Reportresponse.fromJson(json.decode(str));

String reportresponseToJson(Reportresponse data) => json.encode(data.toJson());

class Reportresponse {
    Reportresponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory Reportresponse.fromJson(Map<String, dynamic> json) => Reportresponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
