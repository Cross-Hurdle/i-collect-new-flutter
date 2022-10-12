// To parse this JSON data, do
//
//     final profilePostModle = profilePostModleFromJson(jsonString);

import 'dart:convert';

ProfilePostModle profilePostModleFromJson(String str) => ProfilePostModle.fromJson(json.decode(str));

String profilePostModleToJson(ProfilePostModle data) => json.encode(data.toJson());

class ProfilePostModle {
    ProfilePostModle({
    required    this.products,
    });

    List<Product> products;

    factory ProfilePostModle.fromJson(Map<String, dynamic> json) => ProfilePostModle(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
    required    this.id,
   required     this.name,
   required     this.userId,
   required     this.photos,
    required    this.thumbnailImg,
   required     this.tags,
   required     this.hashtags,
   required     this.createdAt,
    required    this.description,
    required    this.productType,
    required    this.unitPrice,
    required    this.minQty,
    required    this.endDate,
    required    this.shareCount,
     required   this.likecount,
     required   this.user,
     required   this.likeProducts,
     required   this.productsComments,
    });

    int id;
    String name;
    int userId;
    List<String> photos;
    String thumbnailImg;
    String tags;
    String hashtags;
    DateTime createdAt;
    String description;
    int productType;
    int unitPrice;
    int minQty;
    String endDate;
    int shareCount;
    int likecount;
    User user;
    List<LikeProduct> likeProducts;
    List<ProductsComment> productsComments;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        thumbnailImg: json["thumbnail_img"],
        tags: json["tags"],
        hashtags: json["hashtags"]==null?'':json["hashtags"],
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        productType: json["product_type"],
        unitPrice: json["unit_price"],
        minQty: json["min_qty"],
        endDate: json["end_date"],
        shareCount: json["share_count"],
        likecount: json["likecount"]==null?0:json["likecount"],
        user: User.fromJson(json["user"]),
        likeProducts: List<LikeProduct>.from(json["like_products"].map((x) => LikeProduct.fromJson(x))),
        productsComments: List<ProductsComment>.from(json["products_comments"].map((x) => ProductsComment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "thumbnail_img": thumbnailImg,
        "tags": tags,
        "hashtags": hashtags,
        "created_at": createdAt.toIso8601String(),
        "description": description,
        "product_type": productType,
        "unit_price": unitPrice,
        "min_qty": minQty,
        "end_date": endDate,
        "share_count": shareCount,
        "likecount": likecount,
        "user": user.toJson(),
        "like_products": List<dynamic>.from(likeProducts.map((x) => x.toJson())),
        "products_comments": List<dynamic>.from(productsComments.map((x) => x.toJson())),
    };
}

class LikeProduct {
    LikeProduct({
       required this.id,
      required  this.userId,
      required  this.productId,
      required  this.status,
      required  this.likes,
    });

    int id;
    int userId;
    int productId;
    int status;
    int likes;

    factory LikeProduct.fromJson(Map<String, dynamic> json) => LikeProduct(
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

class ProductsComment {
    ProductsComment({
      required  this.id,
      required  this.userId,
    required    this.productId,
     required   this.comment,
      required  this.status,
      required  this.createdAt,
      required  this.user,
      required  this.productsLikeComments,
    });

    int id;
    int userId;
    int productId;
    String comment;
    int status;
    DateTime createdAt;
    User user;
    List<dynamic> productsLikeComments;

    factory ProductsComment.fromJson(Map<String, dynamic> json) => ProductsComment(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
        productsLikeComments: List<dynamic>.from(json["products_like_comments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "comment": comment,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "user": user.toJson(),
        "products_like_comments": List<dynamic>.from(productsLikeComments.map((x) => x)),
    };
}

class User {
    User({
     required   this.id,
     required   this.name,
        required this.profilePic,
    });

    int id;
    String name;
    String profilePic;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic,
    };
}
