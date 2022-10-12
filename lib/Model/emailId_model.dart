// To parse this JSON data, do
//
//     final emailverifyresponse = emailverifyresponseFromJson(jsonString);

import 'dart:convert';

Emailverifyresponse emailverifyresponseFromJson(String str) => Emailverifyresponse.fromJson(json.decode(str));

String emailverifyresponseToJson(Emailverifyresponse data) => json.encode(data.toJson());

class Emailverifyresponse {
    Emailverifyresponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory Emailverifyresponse.fromJson(Map<String, dynamic> json) => Emailverifyresponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
