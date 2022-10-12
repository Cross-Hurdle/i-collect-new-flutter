// To parse this JSON data, do
//
//     final followingModle = followingModleFromJson(jsonString);

import 'dart:convert';

FollowingModle followingModleFromJson(String str) => FollowingModle.fromJson(json.decode(str));

String followingModleToJson(FollowingModle data) => json.encode(data.toJson());

class FollowingModle {
    FollowingModle({
      required  this.finalFollowing,
    });

    List<FinalFollowing> finalFollowing;

    factory FollowingModle.fromJson(Map<String, dynamic> json) => FollowingModle(
        finalFollowing: List<FinalFollowing>.from(json["finalFollowing"].map((x) => FinalFollowing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "finalFollowing": List<dynamic>.from(finalFollowing.map((x) => x.toJson())),
    };
}

class FinalFollowing {
    FinalFollowing({
       required this.counts,
        required this.followingData,
    });

    int counts;
    List<FollowingDatum> followingData;

    factory FinalFollowing.fromJson(Map<String, dynamic> json) => FinalFollowing(
        counts: json["counts"],
        followingData: List<FollowingDatum>.from(json["followingData"].map((x) => FollowingDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "counts": counts,
        "followingData": List<dynamic>.from(followingData.map((x) => x.toJson())),
    };
}

class FollowingDatum {
    FollowingDatum({
      required  this.id,
      required  this.name,
       required this.email,
       required this.profilePic,
    });

    int id;
    String name;
    String email;
    String profilePic;

    factory FollowingDatum.fromJson(Map<String, dynamic> json) => FollowingDatum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profilePic: json["profile_pic"]==null?'':json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_pic": profilePic,
    };
}
