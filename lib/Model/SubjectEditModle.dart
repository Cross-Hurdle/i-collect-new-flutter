// To parse this JSON data, do
//
//     final editNameDataResponseModle = editNameDataResponseModleFromJson(jsonString);

import 'dart:convert';

EditNameDataResponseModle editNameDataResponseModleFromJson(String str) => EditNameDataResponseModle.fromJson(json.decode(str));

String editNameDataResponseModleToJson(EditNameDataResponseModle data) => json.encode(data.toJson());

class EditNameDataResponseModle {
    EditNameDataResponseModle({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory EditNameDataResponseModle.fromJson(Map<String, dynamic> json) => EditNameDataResponseModle(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
