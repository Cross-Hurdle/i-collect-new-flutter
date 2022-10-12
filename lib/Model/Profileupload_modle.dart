// To parse this JSON data, do
//
//     final profileUploadresponse = profileUploadresponseFromJson(jsonString);

import 'dart:convert';

ProfileUploadresponse profileUploadresponseFromJson(String str) => ProfileUploadresponse.fromJson(json.decode(str));

String profileUploadresponseToJson(ProfileUploadresponse data) => json.encode(data.toJson());

class ProfileUploadresponse {
    ProfileUploadresponse({
        required this.success,
        required this.profileUrl,
    });

    int success;
    List<String> profileUrl;

    factory ProfileUploadresponse.fromJson(Map<String, dynamic> json) => ProfileUploadresponse(
        success: json["success"],
        profileUrl: List<String>.from(json["profile_url"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "profile_url": List<dynamic>.from(profileUrl.map((x) => x)),
    };
}
