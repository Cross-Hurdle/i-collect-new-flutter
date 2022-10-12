// To parse this JSON data, do
//
//     final commentViewModle = commentViewModleFromJson(jsonString);

import 'dart:convert';

CommentViewModle commentViewModleFromJson(String str) => CommentViewModle.fromJson(json.decode(str));

String commentViewModleToJson(CommentViewModle data) => json.encode(data.toJson());

class CommentViewModle {
    CommentViewModle({
        required this.userData,
    });

    List<UserDatum> userData;

    factory CommentViewModle.fromJson(Map<String, dynamic> json) => CommentViewModle(
        userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
    };
}

class UserDatum {
    UserDatum({
        required this.id,
        required this.userId,
        required this.groupId,
        required this.postId,
        required this.comment,
        required this.status,
        required this.createdAt,
        required this.likeComments,
        required this.user,
    });

    int id;
    int userId;
    int groupId;
    int postId;
    String comment;
    int status;
    DateTime createdAt;
    List<LikeComment> likeComments;
    User user;

    factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        id: json["id"],
        userId: json["user_id"],
        groupId: json["group_id"],
        postId: json["post_id"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        likeComments: List<LikeComment>.from(json["like_comments"].map((x) => LikeComment.fromJson(x))),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "group_id": groupId,
        "post_id": postId,
        "comment": comment,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "like_comments": List<dynamic>.from(likeComments.map((x) => x.toJson())),
        "user": user.toJson(),
    };
}

class LikeComment {
    LikeComment({
        required this.id,
        required this.commentId,
        required this.userId,
        required this.postId,
        required this.status,
        required this.likecount,
    });

    int id;
    int commentId;
    int userId;
    int postId;
    int status;
    int likecount;

    factory LikeComment.fromJson(Map<String, dynamic> json) => LikeComment(
        id: json["id"],
        commentId: json["comment_id"],
        userId: json["user_id"],
        postId: json["post_id"],
        status: json["status"],
        likecount: json["likecount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment_id": commentId,
        "user_id": userId,
        "post_id": postId,
        "status": status,
        "likecount": likecount,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.profilePic,
    });

    int id;
    String name;
    String profilePic;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"]==null?'': json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic==''?'':profilePic,
    };
}
