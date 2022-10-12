// To parse this JSON data, do
//
//     final followersModle = followersModleFromJson(jsonString);

import 'dart:convert';

FollowersModle followersModleFromJson(String str) => FollowersModle.fromJson(json.decode(str));

String followersModleToJson(FollowersModle data) => json.encode(data.toJson());

class FollowersModle {
    FollowersModle({
      required  this.finalFollower,
    });

    List<FinalFollower> finalFollower;

    factory FollowersModle.fromJson(Map<String, dynamic> json) => FollowersModle(
        finalFollower: List<FinalFollower>.from(json["finalFollower"].map((x) => FinalFollower.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "finalFollower": List<dynamic>.from(finalFollower.map((x) => x.toJson())),
    };
}

class FinalFollower {
    FinalFollower({
       required this.counts,
      required  this.followers,
    });

    int counts;
    List<Follower> followers;

    factory FinalFollower.fromJson(Map<String, dynamic> json) => FinalFollower(
        counts: json["counts"],
        followers: List<Follower>.from(json["followers"].map((x) => Follower.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "counts": counts,
        "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
    };
}

class Follower {
    Follower({
       required this.id,
       required this.name,
        required this.email,
        required this.profilePic,
    });

    int id;
    String name;
    String email;
    String profilePic;

    factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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
