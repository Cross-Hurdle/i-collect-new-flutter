// To parse this JSON data, do
//
//     final pendingOfferModle = pendingOfferModleFromJson(jsonString);

import 'dart:convert';

PendingOfferModle pendingOfferModleFromJson(String str) => PendingOfferModle.fromJson(json.decode(str));

String pendingOfferModleToJson(PendingOfferModle data) => json.encode(data.toJson());

class PendingOfferModle {
    PendingOfferModle({
      required  this.pending,
    });

    List<Pending> pending;

    factory PendingOfferModle.fromJson(Map<String, dynamic> json) => PendingOfferModle(
        pending: List<Pending>.from(json["Pending"].map((x) => Pending.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Pending": List<dynamic>.from(pending.map((x) => x.toJson())),
    };
}

class Pending {
    Pending({
      required  this.id,
      required  this.productId,
      required  this.buyerId,
      required  this.sellerId,
      required  this.makePrice,
      required  this.originalPrice,
      required  this.status,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.product,
      required  this.user,
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

    factory Pending.fromJson(Map<String, dynamic> json) => Pending(
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
      required  this.endDate,
       required this.thumbnailImg,
       required this.name,
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
      required  this.id,
       required this.name,
        required this.profilePic,
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
