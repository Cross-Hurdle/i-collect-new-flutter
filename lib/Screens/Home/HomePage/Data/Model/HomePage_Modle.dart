// To parse this JSON data, do
//
//     final homePageresponse = homePageresponseFromJson(jsonString);

import 'dart:convert';

HomePageresponse homePageresponseFromJson(String str) => HomePageresponse.fromJson(json.decode(str));

String homePageresponseToJson(HomePageresponse data) => json.encode(data.toJson());

class HomePageresponse {
    HomePageresponse({
      required  this.finaloutput,
    });

    List<Finaloutput> finaloutput;

    factory HomePageresponse.fromJson(Map<String, dynamic> json) => HomePageresponse(
        finaloutput: List<Finaloutput>.from(json["finaloutput"].map((x) => Finaloutput.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "finaloutput": List<dynamic>.from(finaloutput.map((x) => x.toJson())),
    };
}

class Finaloutput {
    Finaloutput({
      required  this.id,
      required  this.name,
      required  this.tags,
      required  this.description,
      required  this.unitPrice,
      required  this.thumbnailImg,
      required  this.productType,
      required  this.likecount,
      required  this.likeProducts,
    });

    int id;
    String name;
    String tags;
    String description;
    int unitPrice;
    String thumbnailImg;
    int productType;
    int likecount;
    List<LikeProduct> likeProducts;

    factory Finaloutput.fromJson(Map<String, dynamic> json) => Finaloutput(
        id: json["id"],
        name: json["name"],
        tags: json["tags"],
        description: json["description"],
        unitPrice: json["unit_price"],
        thumbnailImg: json["thumbnail_img"],
        productType: json["product_type"],
        likecount: json["likecount"] == null ? 0 : json["likecount"],
        likeProducts: List<LikeProduct>.from(json["like_products"].map((x) => LikeProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tags": tags,
        "description": description,
        "unit_price": unitPrice,
        "thumbnail_img": thumbnailImg,
        "product_type": productType,
        "likecount": likecount == 0 ? 0 : likecount,
        "like_products": List<dynamic>.from(likeProducts.map((x) => x.toJson())),
    };
}

class LikeProduct {
    LikeProduct({
      required  this.id,
     required   this.userId,
     required   this.productId,
     required   this.likes,
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
