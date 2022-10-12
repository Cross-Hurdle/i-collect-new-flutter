// To parse this JSON data, do
//
//     final topYearresponse = topYearresponseFromJson(jsonString);

import 'dart:convert';

TopYearresponse topYearresponseFromJson(String str) => TopYearresponse.fromJson(json.decode(str));

String topYearresponseToJson(TopYearresponse data) => json.encode(data.toJson());

class TopYearresponse {
    TopYearresponse({
      required  this.topyear,
    });

    List<Topyear> topyear;

    factory TopYearresponse.fromJson(Map<String, dynamic> json) => TopYearresponse(
        topyear: List<Topyear>.from(json["topyear"].map((x) => Topyear.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "topyear": List<dynamic>.from(topyear.map((x) => x.toJson())),
    };
}

class Topyear {
    Topyear({
      required  this.id,
      required  this.name,
      required  this.tags,
      required  this.description,
      required  this.unitPrice,
      required  this.thumbnailImg,
     required   this.photos,
      required  this.productType,
      required  this.likecount,
      required  this.thisyearLike,
      required  this.likeProducts,
    });

    int id;
    String name;
    String tags;
    String description;
    int unitPrice;
    String thumbnailImg;
    String photos;
    int productType;
    int likecount;
    int thisyearLike;
    List<LikeProduct> likeProducts;

    factory Topyear.fromJson(Map<String, dynamic> json) => Topyear(
        id: json["id"],
        name: json["name"],
        tags: json["tags"],
        description: json["description"],
        unitPrice: json["unit_price"],
        thumbnailImg: json["thumbnail_img"],
        photos: json["photos"],
        productType: json["product_type"],
        likecount: json["likecount"],
        thisyearLike: json["thisyear_like"],
        likeProducts: List<LikeProduct>.from(json["like_products"].map((x) => LikeProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tags": tags,
        "description": description,
        "unit_price": unitPrice,
        "thumbnail_img": thumbnailImg,
        "photos": photos,
        "product_type": productType,
        "likecount": likecount,
        "thisyear_like": thisyearLike,
        "like_products": List<dynamic>.from(likeProducts.map((x) => x.toJson())),
    };
}

class LikeProduct {
    LikeProduct({
      required  this.id,
      required  this.userId,
      required  this.productId,
      required  this.likes,
        required this.status,
    });

    int id;
    int userId;
    int productId;
    int likes;
    int status;

    factory LikeProduct.fromJson(Map<String, dynamic> json) => LikeProduct(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        likes: json["likes"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "likes": likes,
        "status": status,
    };
}
