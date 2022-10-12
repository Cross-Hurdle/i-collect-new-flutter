// To parse this JSON data, do
//
//     final hastaggetresponse = hastaggetresponseFromJson(jsonString);

import 'dart:convert';

Hastaggetresponse hastaggetresponseFromJson(String str) => Hastaggetresponse.fromJson(json.decode(str));

String hastaggetresponseToJson(Hastaggetresponse data) => json.encode(data.toJson());

class Hastaggetresponse {
    Hastaggetresponse({
        required this.data,
    });

    List<Datum> data;

    factory Hastaggetresponse.fromJson(Map<String, dynamic> json) => Hastaggetresponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
