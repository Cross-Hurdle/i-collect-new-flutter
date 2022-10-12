// To parse this JSON data, do
//
//     final allUserresponse = allUserresponseFromJson(jsonString);

import 'dart:convert';

AllUserresponse allUserresponseFromJson(String str) => AllUserresponse.fromJson(json.decode(str));

String allUserresponseToJson(AllUserresponse data) => json.encode(data.toJson());

class AllUserresponse {
    AllUserresponse({
      required  this.profiles,
    });

    List<Profile> profiles;

    factory AllUserresponse.fromJson(Map<String, dynamic> json) => AllUserresponse(
        profiles: List<Profile>.from(json["Profiles"].map((x) => Profile.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
    };
}

class Profile {
    Profile({
       required this.id,
       required this.name,
      required  this.deviceToken,
       required this.profilePic,
       required this.bannerImg,
       required this.email,
       required this.status,
    });

    int id;
    String name;
    String deviceToken;
    dynamic profilePic;
    dynamic bannerImg;
    String email;
    String status;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        deviceToken: json["device_token"]==null?'':json["device_token"],
        profilePic: json["profile_pic"],
        bannerImg: json["banner_img"],
        email: json["email"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "device_token": deviceToken==''?'':deviceToken,
        "profile_pic": profilePic,
        "banner_img": bannerImg,
        "email": email,
        "status": status,
    };
}
