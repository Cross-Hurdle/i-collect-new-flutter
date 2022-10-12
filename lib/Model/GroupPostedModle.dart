// To parse this JSON data, do
//
//     final groupPostedDataResponse = groupPostedDataResponseFromJson(jsonString);

import 'dart:convert';

GroupPostedDataResponse groupPostedDataResponseFromJson(String str) => GroupPostedDataResponse.fromJson(json.decode(str));

String groupPostedDataResponseToJson(GroupPostedDataResponse data) => json.encode(data.toJson());

class GroupPostedDataResponse {
    GroupPostedDataResponse({
        required this.uploadedBy,
        required this.commends,
        required this.image,
        required this.status,
    });

    String uploadedBy;
    String commends;
    String image;
    bool status;

    factory GroupPostedDataResponse.fromJson(Map<String, dynamic> json) => GroupPostedDataResponse(
        uploadedBy: json["uploaded_by"],
        commends: json["commends"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "uploaded_by": uploadedBy,
        "commends": commends,
        "image": image,
        "status": status,
    };
}
