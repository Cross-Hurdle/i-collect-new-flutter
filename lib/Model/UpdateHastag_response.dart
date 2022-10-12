// To parse this JSON data, do
//
//     final updateHastagresponse = updateHastagresponseFromJson(jsonString);

import 'dart:convert';

UpdateHastagresponse updateHastagresponseFromJson(String str) => UpdateHastagresponse.fromJson(json.decode(str));

String updateHastagresponseToJson(UpdateHastagresponse data) => json.encode(data.toJson());

class UpdateHastagresponse {
    UpdateHastagresponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory UpdateHastagresponse.fromJson(Map<String, dynamic> json) => UpdateHastagresponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
