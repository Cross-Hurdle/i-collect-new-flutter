// To parse this JSON data, do
//
//     final addHastageDataResponseModle = addHastageDataResponseModleFromJson(jsonString);

import 'dart:convert';

AddHastageDataResponseModle addHastageDataResponseModleFromJson(String str) => AddHastageDataResponseModle.fromJson(json.decode(str));

String addHastageDataResponseModleToJson(AddHastageDataResponseModle data) => json.encode(data.toJson());

class AddHastageDataResponseModle {
    AddHastageDataResponseModle({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory AddHastageDataResponseModle.fromJson(Map<String, dynamic> json) => AddHastageDataResponseModle(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
