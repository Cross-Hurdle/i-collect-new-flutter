// To parse this JSON data, do
//
//     final groupdpRemoveDataResponseModle = groupdpRemoveDataResponseModleFromJson(jsonString);

import 'dart:convert';

GroupdpRemoveDataResponseModle groupdpRemoveDataResponseModleFromJson(String str) => GroupdpRemoveDataResponseModle.fromJson(json.decode(str));

String groupdpRemoveDataResponseModleToJson(GroupdpRemoveDataResponseModle data) => json.encode(data.toJson());

class GroupdpRemoveDataResponseModle {
    GroupdpRemoveDataResponseModle({
        required this.status,
    });

    String status;

    factory GroupdpRemoveDataResponseModle.fromJson(Map<String, dynamic> json) => GroupdpRemoveDataResponseModle(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
