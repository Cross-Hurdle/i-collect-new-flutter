// To parse this JSON data, do
//
//     final myGroupDataResponse = myGroupDataResponseFromJson(jsonString);

import 'dart:convert';

MyGroupDataResponse myGroupDataResponseFromJson(String str) => MyGroupDataResponse.fromJson(json.decode(str));

String myGroupDataResponseToJson(MyGroupDataResponse data) => json.encode(data.toJson());

class MyGroupDataResponse {
    MyGroupDataResponse({
        required this.data,
    });

    List<Datum> data;

    factory MyGroupDataResponse.fromJson(Map<String, dynamic> json) => MyGroupDataResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.groupId,
        required this.subject,
        required this.groupImage,
        required this.message,
        required this.userId,
        required this.status,
    });

    int groupId;
    String subject;
    String groupImage;
    String message;
    int userId;
    int status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        groupId: json["group_id"],
        subject: json["subject"],
        groupImage: json["group_image"]==null?'': json["group_image"],
        message: json["message"],
        userId: json["user_id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "subject": subject,
        "group_image":  groupImage==''?'':groupImage,
        "message": message,
        "user_id": userId,
        "status": status,
    };
}
