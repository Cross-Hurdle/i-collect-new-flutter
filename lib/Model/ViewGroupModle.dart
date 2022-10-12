// To parse this JSON data, do
//
//     final viewGroupDataResponse = viewGroupDataResponseFromJson(jsonString);

import 'dart:convert';

ViewGroupDataResponse viewGroupDataResponseFromJson(String str) => ViewGroupDataResponse.fromJson(json.decode(str));

String viewGroupDataResponseToJson(ViewGroupDataResponse data) => json.encode(data.toJson());

class ViewGroupDataResponse {
    ViewGroupDataResponse({
        required this.data,
        required this.usercount,
    });

    Data data;
    int usercount;

    factory ViewGroupDataResponse.fromJson(Map<String, dynamic> json) => ViewGroupDataResponse(
        data: Data.fromJson(json["data"]),
        usercount: json["Usercount"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "Usercount": usercount,
    };
}

class Data {
    Data({
        required this.id,
        required this.subject,
        required this.groupImage,
        this.groupBanner,
        required this.message,
        required this.userId,
        required this.userList,
        required this.status,
    });

    int id;
    String subject;
    String groupImage;
    dynamic groupBanner;
    String message;
    int userId;
    String userList;
    int status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        subject: json["subject"],
        groupImage: json["group_image"]==null?"":json["group_image"],
         groupBanner: json["group_banner"]==null?"": json["group_banner"],
        message: json["message"],
        userId: json["user_id"],
        userList: json["user_list"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
         "group_image": groupImage ==""?"":groupImage,
         "group_banner": groupBanner == ""?"":groupBanner,
        "message": message,
        "user_id": userId,
        "user_list": userList,
        "status": status,
    };
}








// // To parse this JSON data, do
// //
// //     final viewGroupDataResponse = viewGroupDataResponseFromJson(jsonString);

// import 'dart:convert';

// ViewGroupDataResponse viewGroupDataResponseFromJson(String str) => ViewGroupDataResponse.fromJson(json.decode(str));

// String viewGroupDataResponseToJson(ViewGroupDataResponse data) => json.encode(data.toJson());

// class ViewGroupDataResponse {
//     ViewGroupDataResponse({
//         required this.id,
//         required this.subject,
//         required this.groupImage,
//         required this.groupBanner,
//         required this.message,
//         required this.userId,
//         required this.status,
//     });

//     int id;
//     String subject;
//     String groupImage;
//     String groupBanner;
//     String message;
//     int userId;
//     int status;

//     factory ViewGroupDataResponse.fromJson(Map<String, dynamic> json) => ViewGroupDataResponse(
//         id: json["id"],
//         subject: json["subject"],
//         groupImage: json["group_image"]==null?"":json["group_image"],
//         groupBanner: json["group_banner"]==null?"": json["group_banner"],
//         message: json["message"],
//         userId: json["user_id"],
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "subject": subject,
//         "group_image": groupImage ==""?"":groupImage,
//         "group_banner": groupBanner == ""?"":groupBanner,
//         "message": message,
//         "user_id": userId,
//         "status": status,
//     };
// }
