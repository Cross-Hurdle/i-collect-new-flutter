// To parse this JSON data, do
//
//     final topWeekresponse = topWeekresponseFromJson(jsonString);

import 'dart:convert';

TopWeekresponse topWeekresponseFromJson(String str) => TopWeekresponse.fromJson(json.decode(str));

String topWeekresponseToJson(TopWeekresponse data) => json.encode(data.toJson());

class TopWeekresponse {
    TopWeekresponse({
     required   this.topweek,
    });

    List<Topweek> topweek;

    factory TopWeekresponse.fromJson(Map<String, dynamic> json) => TopWeekresponse(
        topweek: List<Topweek>.from(json["topweek"].map((x) => Topweek.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "topweek": List<dynamic>.from(topweek.map((x) => x.toJson())),
    };
}

class Topweek {
    Topweek({
      required  this.id,
      required  this.name,
      required  this.tags,
      required  this.description,
      required  this.unitPrice,
      required  this.thumbnailImg,
      required  this.photos,
     required   this.productType,
     required   this.likecount,
      required  this.thisweekLike,
        required this.likeProducts,
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
    int thisweekLike;
    List<LikeProduct> likeProducts;

    factory Topweek.fromJson(Map<String, dynamic> json) => Topweek(
        id: json["id"],
        name: json["name"],
        tags: json["tags"],
        description: json["description"],
        unitPrice: json["unit_price"],
        thumbnailImg: json["thumbnail_img"],
        photos: json["photos"],
        productType: json["product_type"],
        likecount: json["likecount"],
        thisweekLike: json["thisweek_like"],
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
        "thisweek_like": thisweekLike,
        "like_products": List<dynamic>.from(likeProducts.map((x) => x.toJson())),
    };
}

class LikeProduct {
    LikeProduct({
       required this.id,
      required  this.userId,
      required  this.productId,
      required  this.likes,
      required  this.status,
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
