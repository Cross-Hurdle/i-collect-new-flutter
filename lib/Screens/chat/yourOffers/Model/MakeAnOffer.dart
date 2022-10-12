// To parse this JSON data, do
//
//     final makeAnOfferModle = makeAnOfferModleFromJson(jsonString);

import 'dart:convert';

MakeAnOfferModle makeAnOfferModleFromJson(String str) => MakeAnOfferModle.fromJson(json.decode(str));

String makeAnOfferModleToJson(MakeAnOfferModle data) => json.encode(data.toJson());

class MakeAnOfferModle {
    MakeAnOfferModle({
     required   this.makeOffer,
    });

    List<MakeOffer> makeOffer;

    factory MakeAnOfferModle.fromJson(Map<String, dynamic> json) => MakeAnOfferModle(
        makeOffer: List<MakeOffer>.from(json["MakeOffer"].map((x) => MakeOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "MakeOffer": List<dynamic>.from(makeOffer.map((x) => x.toJson())),
    };
}

class MakeOffer {
    MakeOffer({
     required   this.id,
     required   this.productId,
       required this.buyerId,
      required  this.sellerId,
       required this.makePrice,
       required this.originalPrice,
      required  this.status,
      required  this.createdAt,
       required this.updatedAt,
       required this.product,
        required this.user,
    });

    int id;
    int productId;
    int buyerId;
    int sellerId;
    int makePrice;
    int originalPrice;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    Product product;
    User user;

    factory MakeOffer.fromJson(Map<String, dynamic> json) => MakeOffer(
        id: json["id"],
        productId: json["product_id"],
        buyerId: json["buyer_id"],
        sellerId: json["seller_id"],
        makePrice: json["make_price"],
        originalPrice: json["original_price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "buyer_id": buyerId,
        "seller_id": sellerId,
        "make_price": makePrice,
        "original_price": originalPrice,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
        "user": user.toJson(),
    };
}

class Product {
    Product({
     required   this.endDate,
      required  this.thumbnailImg,
      required  this.name,
    });

    String endDate;
    String thumbnailImg;
    String name;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        endDate: json["end_date"],
        thumbnailImg: json["thumbnail_img"]==null?'':json["thumbnail_img"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "end_date": endDate,
        "thumbnail_img": thumbnailImg,
        "name": name,
    };
}

class User {
    User({
    required    this.id,
     required   this.name,
      required  this.profilePic,
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
        "profile_pic": profilePic,
    };
}
