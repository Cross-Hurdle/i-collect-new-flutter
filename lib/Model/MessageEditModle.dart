// To parse this JSON data, do
//
//     final editMessageDataResponseModle = editMessageDataResponseModleFromJson(jsonString);

import 'dart:convert';

EditMessageDataResponseModle editMessageDataResponseModleFromJson(String str) => EditMessageDataResponseModle.fromJson(json.decode(str));

String editMessageDataResponseModleToJson(EditMessageDataResponseModle data) => json.encode(data.toJson());

class EditMessageDataResponseModle {
    EditMessageDataResponseModle({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory EditMessageDataResponseModle.fromJson(Map<String, dynamic> json) => EditMessageDataResponseModle(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
