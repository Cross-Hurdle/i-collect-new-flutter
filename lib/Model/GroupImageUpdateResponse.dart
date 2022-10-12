// To parse this JSON data, do
//
//     final updateGroupbannerDataResponse = updateGroupbannerDataResponseFromJson(jsonString);

import 'dart:convert';

UpdateGroupbannerDataResponse updateGroupbannerDataResponseFromJson(String str) => UpdateGroupbannerDataResponse.fromJson(json.decode(str));

String updateGroupbannerDataResponseToJson(UpdateGroupbannerDataResponse data) => json.encode(data.toJson());

class UpdateGroupbannerDataResponse {
    UpdateGroupbannerDataResponse({
        required this.success,
        required this.groupBannerUrl,
    });

    bool success;
    String groupBannerUrl;

    factory UpdateGroupbannerDataResponse.fromJson(Map<String, dynamic> json) => UpdateGroupbannerDataResponse(
        success: json["success"],
        groupBannerUrl: json["group_banner_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "group_banner_url": groupBannerUrl,
    };
}
