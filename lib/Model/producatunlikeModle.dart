// To parse this JSON data, do
//
//     final productUnlikeModle = productUnlikeModleFromJson(jsonString);

import 'dart:convert';

ProductUnlikeModle productUnlikeModleFromJson(String str) => ProductUnlikeModle.fromJson(json.decode(str));

String productUnlikeModleToJson(ProductUnlikeModle data) => json.encode(data.toJson());

class ProductUnlikeModle {
    ProductUnlikeModle({
        required this.likeData,
    });

    List<LikeDatum> likeData;

    factory ProductUnlikeModle.fromJson(Map<String, dynamic> json) => ProductUnlikeModle(
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
        required this.status,
        required this.likes,
    });

    int id;
    int userId;
    int productId;
    int status;
    int likes;

    factory LikeDatum.fromJson(Map<String, dynamic> json) => LikeDatum(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
        likes: json["likes"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "status": status,
        "likes": likes,
    };
}
