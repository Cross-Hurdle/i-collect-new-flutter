// To parse this JSON data, do
//
//     final likeDataResponse = likeDataResponseFromJson(jsonString);

import 'dart:convert';

LikeDataResponse likeDataResponseFromJson(String str) => LikeDataResponse.fromJson(json.decode(str));

String likeDataResponseToJson(LikeDataResponse data) => json.encode(data.toJson());

class LikeDataResponse {
    LikeDataResponse({
        required this.likeData,
    });

    List<LikeDatum> likeData;

    factory LikeDataResponse.fromJson(Map<String, dynamic> json) => LikeDataResponse(
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
        required this.status,
        required this.likeCount,
    });

    int id;
    int userId;
    int postId;
    int status;
    int likeCount;

    factory LikeDatum.fromJson(Map<String, dynamic> json) => LikeDatum(
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
