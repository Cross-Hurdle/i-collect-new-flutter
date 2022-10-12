// To parse this JSON data, do
//
//     final productFindoneResponse = productFindoneResponseFromJson(jsonString);

import 'dart:convert';

ProductFindoneResponse productFindoneResponseFromJson(String str) => ProductFindoneResponse.fromJson(json.decode(str));

String productFindoneResponseToJson(ProductFindoneResponse data) => json.encode(data.toJson());

class ProductFindoneResponse {
    ProductFindoneResponse({
    required    this.product,
    });

    Product product;

    factory ProductFindoneResponse.fromJson(Map<String, dynamic> json) => ProductFindoneResponse(
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
    };
}

class Product {
    Product({
    required    this.id,
   required     this.name,
   required     this.productType,
   required     this.userId,
   required     this.tags,
  required      this.hashtags,
   required     this.thumbnailImg,
   required     this.addedBy,
  required     this.description,
   required     this.unitPrice,
 required       this.minQty,
  required      this.photos,
  required      this.endDate,
  required      this.sellerAddress,
  required      this.likecount,
   required     this.shareCount,
   required     this.likeProducts,
   required     this.productsComments,
    });

    int id;
    String name;
    int productType;
    int userId;
    String tags;
    String hashtags;
    String thumbnailImg;
    String addedBy;
    String description;
    int unitPrice;
    int minQty;
    List<String> photos;
    String endDate;
    String sellerAddress;
    int likecount;
    int shareCount;
    List<LikeProduct> likeProducts;
    List<ProductsComment> productsComments;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        productType: json["product_type"],
        userId: json["user_id"],
        tags: json["tags"],
        hashtags: json["hashtags"],
        thumbnailImg: json["thumbnail_img"],
        addedBy: json["added_by"],
        description: json["description"],
        unitPrice: json["unit_price"],
        minQty: json["min_qty"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        endDate: json["end_date"],
        sellerAddress: json["seller_address"],
        likecount: json["likecount"],
        shareCount: json["share_count"],
        likeProducts: List<LikeProduct>.from(json["like_products"].map((x) => LikeProduct.fromJson(x))),
        productsComments: List<ProductsComment>.from(json["products_comments"].map((x) => ProductsComment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_type": productType,
        "user_id": userId,
        "tags": tags,
        "hashtags": hashtags,
        "thumbnail_img": thumbnailImg,
        "added_by": addedBy,
        "description": description,
        "unit_price": unitPrice,
        "min_qty": minQty,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "end_date": endDate,
        "seller_address": sellerAddress,
        "likecount": likecount,
        "share_count": shareCount,
        "like_products": List<dynamic>.from(likeProducts.map((x) => x.toJson())),
        "products_comments": List<dynamic>.from(productsComments.map((x) => x.toJson())),
    };
}

class LikeProduct {
    LikeProduct({
      required  this.id,
      required  this.userId,
       required this.productId,
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

class ProductsComment {
    ProductsComment({
       required this.id,
      required  this.userId,
      required  this.productId,
      required  this.comment,
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
       required this.id,
      required  this.name,
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
