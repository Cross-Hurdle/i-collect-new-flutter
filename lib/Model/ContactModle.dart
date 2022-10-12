// To parse this JSON data, do
//
//     final allContactDataResponse = allContactDataResponseFromJson(jsonString);

import 'dart:convert';

AllContactDataResponse allContactDataResponseFromJson(String str) => AllContactDataResponse.fromJson(json.decode(str));

String allContactDataResponseToJson(AllContactDataResponse data) => json.encode(data.toJson());

class AllContactDataResponse {
    AllContactDataResponse({
        required this.data,
    });

    List<Datum> data;

    factory AllContactDataResponse.fromJson(Map<String, dynamic> json) => AllContactDataResponse(
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
        required this.profilePic,
    });

    int id;
    String name;
    String profilePic;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"] == null ?'' : json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // ignore: unnecessary_null_comparison
        "profile_pic": profilePic == null ? '' : profilePic,
    };
}
