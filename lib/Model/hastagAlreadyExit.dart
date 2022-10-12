// To parse this JSON data, do
//
//     final hastageExistDataResponseModle = hastageExistDataResponseModleFromJson(jsonString);

import 'dart:convert';

HastageExistDataResponseModle hastageExistDataResponseModleFromJson(String str) => HastageExistDataResponseModle.fromJson(json.decode(str));

String hastageExistDataResponseModleToJson(HastageExistDataResponseModle data) => json.encode(data.toJson());

class HastageExistDataResponseModle {
    HastageExistDataResponseModle({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory HastageExistDataResponseModle.fromJson(Map<String, dynamic> json) => HastageExistDataResponseModle(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
