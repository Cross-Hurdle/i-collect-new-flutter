// To parse this JSON data, do
//
//     final commentCreateModle = commentCreateModleFromJson(jsonString);

import 'dart:convert';

CommentCreateModle commentCreateModleFromJson(String str) => CommentCreateModle.fromJson(json.decode(str));

String commentCreateModleToJson(CommentCreateModle data) => json.encode(data.toJson());

class CommentCreateModle {
    CommentCreateModle({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory CommentCreateModle.fromJson(Map<String, dynamic> json) => CommentCreateModle(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
