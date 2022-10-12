// To parse this JSON data, do
//
//     final groupDPresponse = groupDPresponseFromJson(jsonString);

import 'dart:convert';

GroupDPresponse groupDPresponseFromJson(String str) => GroupDPresponse.fromJson(json.decode(str));

String groupDPresponseToJson(GroupDPresponse data) => json.encode(data.toJson());

class GroupDPresponse {
    GroupDPresponse({
        required this.id,
        required this.success,
        required this.groupImageUrl,
    });

    int id;
    bool success;
    String groupImageUrl;

    factory GroupDPresponse.fromJson(Map<String, dynamic> json) => GroupDPresponse(
        id: json["id"],
        success: json["success"],
        groupImageUrl: json["group_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "success": success,
        "group_image_url": groupImageUrl,
    };
}
