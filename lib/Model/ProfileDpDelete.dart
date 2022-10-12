// To parse this JSON data, do
//
//     final deleteProfileDpDataResponse = deleteProfileDpDataResponseFromJson(jsonString);

import 'dart:convert';

DeleteProfileDpDataResponse deleteProfileDpDataResponseFromJson(String str) => DeleteProfileDpDataResponse.fromJson(json.decode(str));

String deleteProfileDpDataResponseToJson(DeleteProfileDpDataResponse data) => json.encode(data.toJson());

class DeleteProfileDpDataResponse {
    DeleteProfileDpDataResponse({
        required this.status,
    });

    String status;

    factory DeleteProfileDpDataResponse.fromJson(Map<String, dynamic> json) => DeleteProfileDpDataResponse(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
