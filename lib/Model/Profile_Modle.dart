// To parse this JSON data, do
//
//     final profilePhotoresponse = profilePhotoresponseFromJson(jsonString);

import 'dart:convert';

ProfilePhotoresponse profilePhotoresponseFromJson(String str) => ProfilePhotoresponse.fromJson(json.decode(str));

String profilePhotoresponseToJson(ProfilePhotoresponse data) => json.encode(data.toJson());

class ProfilePhotoresponse {
    ProfilePhotoresponse({
        required this.id,
        required this.profilePic,
        required this.bannerImg,
    });

    int id;
    String profilePic;
    String bannerImg;

    factory ProfilePhotoresponse.fromJson(Map<String, dynamic> json) => ProfilePhotoresponse(
        id: json["id"],
        profilePic: json["profile_pic"] ==null?'': json["profile_pic"] ,
        bannerImg: json["banner_img"] ==null?'':json["banner_img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_pic": profilePic == ''?'':profilePic,
        "banner_img": bannerImg== ''?'':bannerImg,
    };
}
//  groupImage: json["group_image"] == null ? '' : json["group_image"],
//         message: json["message"],
//         userId: json["user_id"],
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "subject": subject,
//         // ignore: unnecessary_null_comparison
//         "group_image": groupImage == null ? '' : groupImage,