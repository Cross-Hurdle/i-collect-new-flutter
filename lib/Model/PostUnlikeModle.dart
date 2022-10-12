// To parse this JSON data, do
//
//     final unLikeDataResponse = unLikeDataResponseFromJson(jsonString);

import 'dart:convert';

UnLikeDataResponse unLikeDataResponseFromJson(String str) => UnLikeDataResponse.fromJson(json.decode(str));

String unLikeDataResponseToJson(UnLikeDataResponse data) => json.encode(data.toJson());

class UnLikeDataResponse {
    UnLikeDataResponse({
        required this.likeData,
    });

    List<LikeDatum> likeData;

    factory UnLikeDataResponse.fromJson(Map<String, dynamic> json) => UnLikeDataResponse(
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
