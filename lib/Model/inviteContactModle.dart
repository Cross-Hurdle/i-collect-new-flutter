// To parse this JSON data, do
//
//     final inviteContactDataResponseModle = inviteContactDataResponseModleFromJson(jsonString);

import 'dart:convert';

InviteContactDataResponseModle inviteContactDataResponseModleFromJson(String str) => InviteContactDataResponseModle.fromJson(json.decode(str));

String inviteContactDataResponseModleToJson(InviteContactDataResponseModle data) => json.encode(data.toJson());

class InviteContactDataResponseModle {
    InviteContactDataResponseModle({
        required this.data,
    });

    List<Datum> data;

    factory InviteContactDataResponseModle.fromJson(Map<String, dynamic> json) => InviteContactDataResponseModle(
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
        "profile_pic": profilePic == '' ? '' : profilePic,
    };
}
