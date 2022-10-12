// To parse this JSON data, do
//
//     final createGroupDataResponse = createGroupDataResponseFromJson(jsonString);

import 'dart:convert';

CreateGroupDataResponse createGroupDataResponseFromJson(String str) => CreateGroupDataResponse.fromJson(json.decode(str));

String createGroupDataResponseToJson(CreateGroupDataResponse data) => json.encode(data.toJson());

class CreateGroupDataResponse {
    CreateGroupDataResponse({
        required this.status,
        required this.message,
    });

    bool status;
    String message;

    factory CreateGroupDataResponse.fromJson(Map<String, dynamic> json) => CreateGroupDataResponse(
        status: json["Status"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
    };
}
