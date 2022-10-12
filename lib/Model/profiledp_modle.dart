// To parse this JSON data, do
//
//     final profiledpModel = profiledpModelFromJson(jsonString);

import 'dart:convert';

ProfiledpModel profiledpModelFromJson(String str) => ProfiledpModel.fromJson(json.decode(str));

String profiledpModelToJson(ProfiledpModel data) => json.encode(data.toJson());

class ProfiledpModel {
    ProfiledpModel({
        required this.success,
        required this.profilePicUrl,
    });

    bool success;
    String profilePicUrl;

    factory ProfiledpModel.fromJson(Map<String, dynamic> json) => ProfiledpModel(
        success: json["success"],
        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "profile_pic_url": profilePicUrl,
    };
}
