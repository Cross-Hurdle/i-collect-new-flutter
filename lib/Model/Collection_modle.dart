// To parse this JSON data, do
//
//     final collectionResponse = collectionResponseFromJson(jsonString);

import 'dart:convert';

CollectionResponse collectionResponseFromJson(String str) => CollectionResponse.fromJson(json.decode(str));

String collectionResponseToJson(CollectionResponse data) => json.encode(data.toJson());

class CollectionResponse {
    CollectionResponse({
       required this.data,
    });

    List<Datum> data;

    factory CollectionResponse.fromJson(Map<String, dynamic> json) => CollectionResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
       required this.id,
       required this.title,
       required this.image,
       required this.status,
       required this.createdAt,
       required this.updatedAt,
    });

    int id;
    String title;
    String image;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}