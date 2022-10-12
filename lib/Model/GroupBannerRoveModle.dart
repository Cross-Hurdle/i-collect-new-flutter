// To parse this JSON data, do
//
//     final groupBannerRemoveDataResponseModle = groupBannerRemoveDataResponseModleFromJson(jsonString);

import 'dart:convert';

GroupBannerRemoveDataResponseModle groupBannerRemoveDataResponseModleFromJson(String str) => GroupBannerRemoveDataResponseModle.fromJson(json.decode(str));

String groupBannerRemoveDataResponseModleToJson(GroupBannerRemoveDataResponseModle data) => json.encode(data.toJson());

class GroupBannerRemoveDataResponseModle {
    GroupBannerRemoveDataResponseModle({
        required this.status,
    });

    String status;

    factory GroupBannerRemoveDataResponseModle.fromJson(Map<String, dynamic> json) => GroupBannerRemoveDataResponseModle(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
