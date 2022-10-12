// To parse this JSON data, do
//
//     final faQresponse = faQresponseFromJson(jsonString);

import 'dart:convert';

FaQresponse faQresponseFromJson(String str) => FaQresponse.fromJson(json.decode(str));

String faQresponseToJson(FaQresponse data) => json.encode(data.toJson());

class FaQresponse {
    FaQresponse({
        required this.data,
    });

    List<Datum> data;

    factory FaQresponse.fromJson(Map<String, dynamic> json) => FaQresponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.question,
        required this.answer,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String question;
    String answer;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
