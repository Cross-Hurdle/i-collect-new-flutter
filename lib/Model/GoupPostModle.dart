// To parse this JSON data, do
//
//     final groupPostedDataResponse = groupPostedDataResponseFromJson(jsonString);

import 'dart:convert';

GroupPostedDataResponse groupPostedDataResponseFromJson(String str) => GroupPostedDataResponse.fromJson(json.decode(str));

String groupPostedDataResponseToJson(GroupPostedDataResponse data) => json.encode(data.toJson());

class GroupPostedDataResponse {
    GroupPostedDataResponse({
        required this.userData,
    });

    List<UserDatum> userData;

    factory GroupPostedDataResponse.fromJson(Map<String, dynamic> json) => GroupPostedDataResponse(
        userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
    };
}

class UserDatum {
    UserDatum({
        required this.id,
        required this.fromUserId,
        required this.groupId,
        required this.createdAt,
        required this.photos,
        required this.message,
        required this.status,
        required this.likes,
        required this.user,
        required this.comments,
    });

    int id;
    int fromUserId;
    int groupId;
    DateTime createdAt;
    String photos;
    String message;
    int status;
    List<Like> likes;
    User user;
    List<Comment> comments;

    factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        id: json["id"],
        fromUserId: json["fromUserId"],
        groupId: json["group_id"],
        createdAt: DateTime.parse(json["created_at"]),
        photos: json["photos"]==null?'':json["photos"],
        message: json["message"],
        status: json["status"],
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        user: User.fromJson(json["user"]),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fromUserId": fromUserId,
        "group_id": groupId,
        "created_at": createdAt.toIso8601String(),
        "photos": photos ==''?'':photos,
        "message": message,
        "status": status,
        "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
        "user": user.toJson(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    Comment({
        required this.id,
        required this.userId,
        required this.groupId,
        required this.postId,
        required this.comment,
        required this.status,
        required this.createdAt,
        required this.user,
        required this.likeComments,
    });

    int id;
    int userId;
    int groupId;
    int postId;
    String comment;
    int status;
    DateTime createdAt;
    User user;
    List<LikeComment> likeComments;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        groupId: json["group_id"],
        postId: json["post_id"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        user: User.fromJson(json["user"]),
        likeComments: List<LikeComment>.from(json["like_comments"].map((x) => LikeComment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "group_id": groupId,
        "post_id": postId,
        "comment": comment,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "user": user.toJson(),
        "like_comments": List<dynamic>.from(likeComments.map((x) => x.toJson())),
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
        profilePic: json["profile_pic"]==null?'':json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic==''?'': profilePic,
    };
}

class Like {
    Like({
        required this.id,
        required this.userId,
        required this.postId,
        required this.status,
        required this.likeCount,
    });

    int id;
    int userId;
    int postId;
    int status;
    int likeCount;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        userId: json["user_id"],
        postId: json["post_id"],
        status: json["status"],
        likeCount: json["like_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "post_id": postId,
        "status": status,
        "like_count": likeCount,
    };
}
