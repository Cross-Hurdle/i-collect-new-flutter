// To parse this JSON data, do
//
//     final groupMemberResponse = groupMemberResponseFromJson(jsonString);

import 'dart:convert';

GroupMemberResponse groupMemberResponseFromJson(String str) => GroupMemberResponse.fromJson(json.decode(str));

String groupMemberResponseToJson(GroupMemberResponse data) => json.encode(data.toJson());

class GroupMemberResponse {
    GroupMemberResponse({
        required this.admin,
        required this.userLists,
    });

    List<Admin> admin;
    List<Admin> userLists;

    factory GroupMemberResponse.fromJson(Map<String, dynamic> json) => GroupMemberResponse(
        admin: List<Admin>.from(json["admin"].map((x) => Admin.fromJson(x))),
        userLists: List<Admin>.from(json["user_lists"].map((x) => Admin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "admin": List<dynamic>.from(admin.map((x) => x.toJson())),
        "user_lists": List<dynamic>.from(userLists.map((x) => x.toJson())),
    };
}

class Admin {
    Admin({
        required this.id,
        required this.name,
        required this.profilePic,
    });

    int id;
    String name;
    String profilePic;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"] == null? '' : json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic == '' ? '' : profilePic,
    };
}
