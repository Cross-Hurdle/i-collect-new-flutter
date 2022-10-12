// To parse this JSON data, do
//
//     final updateProfileDataResponse = updateProfileDataResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileDataResponse updateProfileDataResponseFromJson(String str) => UpdateProfileDataResponse.fromJson(json.decode(str));

String updateProfileDataResponseToJson(UpdateProfileDataResponse data) => json.encode(data.toJson());

class UpdateProfileDataResponse {
    UpdateProfileDataResponse({
        required this.success,
        required this.profilePicUrl,
    });

    bool success;
    String profilePicUrl;

    factory UpdateProfileDataResponse.fromJson(Map<String, dynamic> json) => UpdateProfileDataResponse(
        success: json["success"],
        profilePicUrl: json["profile_pic_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "profile_pic_url": profilePicUrl,
    };
}
