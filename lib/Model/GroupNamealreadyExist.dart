// To parse this JSON data, do
//
//     final groupNameAlreadyExistDataResponse = groupNameAlreadyExistDataResponseFromJson(jsonString);

import 'dart:convert';

GroupNameAlreadyExistDataResponse groupNameAlreadyExistDataResponseFromJson(String str) => GroupNameAlreadyExistDataResponse.fromJson(json.decode(str));

String groupNameAlreadyExistDataResponseToJson(GroupNameAlreadyExistDataResponse data) => json.encode(data.toJson());

class GroupNameAlreadyExistDataResponse {
    GroupNameAlreadyExistDataResponse({
        required this.result,
        required this.message,
    });

    bool result;
    String message;

    factory GroupNameAlreadyExistDataResponse.fromJson(Map<String, dynamic> json) => GroupNameAlreadyExistDataResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}
