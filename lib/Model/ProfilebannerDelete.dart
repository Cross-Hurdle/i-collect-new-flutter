// To parse this JSON data, do
//
//     final deleteProfileBannerDataResponse = deleteProfileBannerDataResponseFromJson(jsonString);

import 'dart:convert';

DeleteProfileBannerDataResponse deleteProfileBannerDataResponseFromJson(String str) => DeleteProfileBannerDataResponse.fromJson(json.decode(str));

String deleteProfileBannerDataResponseToJson(DeleteProfileBannerDataResponse data) => json.encode(data.toJson());

class DeleteProfileBannerDataResponse {
    DeleteProfileBannerDataResponse({
        required this.status,
    });

    String status;

    factory DeleteProfileBannerDataResponse.fromJson(Map<String, dynamic> json) => DeleteProfileBannerDataResponse(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
