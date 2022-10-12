// To parse this JSON data, do
//
//     final groupPosteddeletedDataResponse = groupPosteddeletedDataResponseFromJson(jsonString);

import 'dart:convert';

GroupPosteddeletedDataResponse groupPosteddeletedDataResponseFromJson(String str) => GroupPosteddeletedDataResponse.fromJson(json.decode(str));

String groupPosteddeletedDataResponseToJson(GroupPosteddeletedDataResponse data) => json.encode(data.toJson());

class GroupPosteddeletedDataResponse {
    GroupPosteddeletedDataResponse({
        required this.status,
    });

    String status;

    factory GroupPosteddeletedDataResponse.fromJson(Map<String, dynamic> json) => GroupPosteddeletedDataResponse(
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
    };
}
