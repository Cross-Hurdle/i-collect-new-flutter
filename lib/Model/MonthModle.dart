// To parse this JSON data, do
//
//     final topMonthresponse = topMonthresponseFromJson(jsonString);

import 'dart:convert';

TopMonthresponse topMonthresponseFromJson(String str) => TopMonthresponse.fromJson(json.decode(str));

String topMonthresponseToJson(TopMonthresponse data) => json.encode(data.toJson());

class TopMonthresponse {
    TopMonthresponse({
      required  this.topmonth,
    });

    List<Topmonth> topmonth;

    factory TopMonthresponse.fromJson(Map<String, dynamic> json) => TopMonthresponse(
        topmonth: List<Topmonth>.from(json["topmonth"].map((x) => Topmonth.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "topmonth": List<dynamic>.from(topmonth.map((x) => x.toJson())),
    };
}

class Topmonth {
    Topmonth({
      required  this.id,
      required  this.name,
      required  this.tags,
      required  this.description,
      required  this.unitPrice,
       required this.thumbnailImg,
      required  this.photos,
      required  this.productType,
      required  this.likecount,
      required  this.thismonthLike,
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
    int thismonthLike;
    List<LikeProduct> likeProducts;

    factory Topmonth.fromJson(Map<String, dynamic> json) => Topmonth(
        id: json["id"],
        name: json["name"],
        tags: json["tags"],
        description: json["description"],
        unitPrice: json["unit_price"],
        thumbnailImg: json["thumbnail_img"],
        photos: json["photos"],
        productType: json["product_type"],
        likecount: json["likecount"],
        thismonthLike: json["thismonth_like"],
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
        "thismonth_like": thismonthLike,
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
