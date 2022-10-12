// To parse this JSON data, do
//
//     final productCommentUnLikeModle = productCommentUnLikeModleFromJson(jsonString);

import 'dart:convert';

ProductCommentUnLikeModle productCommentUnLikeModleFromJson(String str) => ProductCommentUnLikeModle.fromJson(json.decode(str));

String productCommentUnLikeModleToJson(ProductCommentUnLikeModle data) => json.encode(data.toJson());

class ProductCommentUnLikeModle {
    ProductCommentUnLikeModle({
      required  this.likeData,
    });

    List<LikeDatum> likeData;

    factory ProductCommentUnLikeModle.fromJson(Map<String, dynamic> json) => ProductCommentUnLikeModle(
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
       required this.productId,
      required  this.commentId,
       required this.status,
        required this.likecount,
    });

    int id;
    int userId;
    int productId;
    int commentId;
    int status;
    int likecount;

    factory LikeDatum.fromJson(Map<String, dynamic> json) => LikeDatum(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        commentId: json["comment_id"],
        status: json["status"],
        likecount: json["likecount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "comment_id": commentId,
        "status": status,
        "likecount": likecount,
    };
}
