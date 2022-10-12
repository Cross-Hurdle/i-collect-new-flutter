// To parse this JSON data, do
//
//     final helpresponse = helpresponseFromJson(jsonString);

import 'dart:convert';

Helpresponse helpresponseFromJson(String str) => Helpresponse.fromJson(json.decode(str));

String helpresponseToJson(Helpresponse data) => json.encode(data.toJson());

class Helpresponse {
    Helpresponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory Helpresponse.fromJson(Map<String, dynamic> json) => Helpresponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}