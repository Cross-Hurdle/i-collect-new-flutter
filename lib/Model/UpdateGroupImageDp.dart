// To parse this JSON data, do
//
//     final updateGroupImageDpDataResponse = updateGroupImageDpDataResponseFromJson(jsonString);

import 'dart:convert';

UpdateGroupImageDpDataResponse updateGroupImageDpDataResponseFromJson(String str) => UpdateGroupImageDpDataResponse.fromJson(json.decode(str));

String updateGroupImageDpDataResponseToJson(UpdateGroupImageDpDataResponse data) => json.encode(data.toJson());

class UpdateGroupImageDpDataResponse {
    UpdateGroupImageDpDataResponse({
        required this.success,
        required this.groupImageUrl,
    });

    bool success;
    String groupImageUrl;

    factory UpdateGroupImageDpDataResponse.fromJson(Map<String, dynamic> json) => UpdateGroupImageDpDataResponse(
        success: json["success"]==null?'':json["success"],
        groupImageUrl: json["group_image_url"]==null?'': json["group_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == false?"":success,
        "group_image_url": groupImageUrl == ""?"":groupImageUrl,
    };
}
