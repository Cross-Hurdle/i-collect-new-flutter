// To parse this JSON data, do
//
//     final followeCountModle = followeCountModleFromJson(jsonString);

import 'dart:convert';

FolloweCountModle followeCountModleFromJson(String str) => FolloweCountModle.fromJson(json.decode(str));

String followeCountModleToJson(FolloweCountModle data) => json.encode(data.toJson());

class FolloweCountModle {
    FolloweCountModle({
       required this.followingCount,
      required  this.followersCount,
      required  this.productCount,
       required this.followStatus,
        required this.message,
    });

    int followingCount;
    int followersCount;
    int productCount;
    int followStatus;
    bool message;

    factory FolloweCountModle.fromJson(Map<String, dynamic> json) => FolloweCountModle(
        followingCount: json["Following_count"],
        followersCount: json["Followers_count"],
        productCount: json["Product_count"],
        followStatus: json["FollowStatus"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Following_count": followingCount,
        "Followers_count": followersCount,
        "Product_count": productCount,
        "FollowStatus": followStatus,
        "Message": message,
    };
}
