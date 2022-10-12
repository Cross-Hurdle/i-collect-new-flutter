// To parse this JSON data, do
//
//     final productCommentModle = productCommentModleFromJson(jsonString);

import 'dart:convert';

ProductCommentModle productCommentModleFromJson(String str) => ProductCommentModle.fromJson(json.decode(str));

String productCommentModleToJson(ProductCommentModle data) => json.encode(data.toJson());

class ProductCommentModle {
    ProductCommentModle({
      required  this.userData,
    });

    List<UserDatum> userData;

    factory ProductCommentModle.fromJson(Map<String, dynamic> json) => ProductCommentModle(
        userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
    };
}

class UserDatum {
    UserDatum({
      required  this.id,
      required  this.userId,
      required  this.productId,
      required  this.comment,
      required  this.status,
      required  this.createdAt,
      required  this.productsLikeComments,
      required  this.user,
    });

    int id;
    int userId;
    int productId;
    String comment;
    int status;
    DateTime createdAt;
    List<ProductsLikeComment> productsLikeComments;
    User user;

    factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        productsLikeComments: List<ProductsLikeComment>.from(json["products_like_comments"].map((x) => ProductsLikeComment.fromJson(x))),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "comment": comment,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "products_like_comments": List<dynamic>.from(productsLikeComments.map((x) => x.toJson())),
        "user": user.toJson(),
    };
}

class ProductsLikeComment {
    ProductsLikeComment({
      required  this.id,
      required  this.commentId,
      required  this.userId,
      required  this.productId,
      required  this.status,
      required  this.likecount,
    });

    int id;
    int commentId;
    int userId;
    int productId;
    int status;
    int likecount;

    factory ProductsLikeComment.fromJson(Map<String, dynamic> json) => ProductsLikeComment(
        id: json["id"],
        commentId: json["comment_id"],
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
        likecount: json["likecount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment_id": commentId,
        "user_id": userId,
        "product_id": productId,
        "status": status,
        "likecount": likecount,
    };
}

class User {
    User({
      required  this.id,
      required  this.name,
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
