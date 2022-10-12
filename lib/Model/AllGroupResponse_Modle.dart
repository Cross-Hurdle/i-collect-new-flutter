// To parse this JSON data, do
//
//     final allGroupDataResponseModle = allGroupDataResponseModleFromJson(jsonString);

import 'dart:convert';

AllGroupDataResponseModle allGroupDataResponseModleFromJson(String str) => AllGroupDataResponseModle.fromJson(json.decode(str));

String allGroupDataResponseModleToJson(AllGroupDataResponseModle data) => json.encode(data.toJson());

class AllGroupDataResponseModle {
    AllGroupDataResponseModle({
        required this.finalData,
    });

    List<FinalDatum> finalData;

    factory AllGroupDataResponseModle.fromJson(Map<String, dynamic> json) => AllGroupDataResponseModle(
        finalData: List<FinalDatum>.from(json["Final_data"].map((x) => FinalDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Final_data": List<dynamic>.from(finalData.map((x) => x.toJson())),
    };
}

class FinalDatum {
    FinalDatum({
        required this.id,
        required this.subject,
        required this.groupImage,
        required this.groupBanner,
        required this.message,
        required this.userId,
        required this.userList,
        required this.status,
    });

    int id;
    String subject;
    String groupImage;
    String groupBanner;
    String message;
    int userId;
    String userList;
    int status;

    factory FinalDatum.fromJson(Map<String, dynamic> json) => FinalDatum(
        id: json["id"],
        subject: json["subject"],
        groupImage: json["group_image"]==null?'': json["group_image"],
        groupBanner: json["group_banner"]==null?'': json["group_banner"],
        message: json["message"],
        userId: json["user_id"],
        userList: json["user_list"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "group_image": groupImage==''?'':groupImage,
        "group_banner": groupBanner==''?'':groupBanner,
        "message": message,
        "user_id": userId,
        "user_list": userList,
        "status": status,
    };
}
