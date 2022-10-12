// To parse this JSON data, do
//
//     final commentUnLikeModle = commentUnLikeModleFromJson(jsonString);

import 'dart:convert';

CommentUnLikeModle commentUnLikeModleFromJson(String str) => CommentUnLikeModle.fromJson(json.decode(str));

String commentUnLikeModleToJson(CommentUnLikeModle data) => json.encode(data.toJson());

class CommentUnLikeModle {
    CommentUnLikeModle({
        required this.likeData,
    });

    List<LikeDatum> likeData;

    factory CommentUnLikeModle.fromJson(Map<String, dynamic> json) => CommentUnLikeModle(
        likeData: List<LikeDatum>.from(json["Like_Data"].map((x) => LikeDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Like_Data": List<dynamic>.from(likeData.map((x) => x.toJson())),
    };
}

class LikeDatum {
    LikeDatum({
        required this.id,
        required this.userId,
        required this.postId,
        required this.commentId,
        required this.status,
        required this.likecount,
    });

    int id;
    int userId;
    int postId;
    int commentId;
    int status;
    int likecount;

    factory LikeDatum.fromJson(Map<String, dynamic> json) => LikeDatum(
        id: json["id"],
        userId: json["user_id"],
        postId: json["post_id"],
        commentId: json["comment_id"],
        status: json["status"],
        likecount: json["likecount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "post_id": postId,
        "comment_id": commentId,
        "status": status,
        "likecount": likecount,
    };
}
