// To parse this JSON data, do
//
//     final topAllTimeresponse = topAllTimeresponseFromJson(jsonString);

import 'dart:convert';

TopAllTimeresponse topAllTimeresponseFromJson(String str) => TopAllTimeresponse.fromJson(json.decode(str));

String topAllTimeresponseToJson(TopAllTimeresponse data) => json.encode(data.toJson());

class TopAllTimeresponse {
    TopAllTimeresponse({
     required  this.alltimeProduct,
    });

    List<AlltimeProduct> alltimeProduct;

    factory TopAllTimeresponse.fromJson(Map<String, dynamic> json) => TopAllTimeresponse(
        alltimeProduct: List<AlltimeProduct>.from(json["Alltime_Product"].map((x) => AlltimeProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Alltime_Product": List<dynamic>.from(alltimeProduct.map((x) => x.toJson())),
    };
}

class AlltimeProduct {
    AlltimeProduct({
       required this.id,
     required   this.name,
      required  this.userId,
      required  this.addedBy,
      required  this.description,
     required   this.photos,
      required  this.thumbnailImg,
      required  this.tags,
      required  this.createdAt,
      required  this.productType,
      required  this.unitPrice,
     required   this.minQty,
     required   this.endDate,
     required   this.likeProducts,
     required   this.user,
    });

    int id;
    String name;
    int userId;
    String addedBy;
    String description;
    List<String> photos;
    String thumbnailImg;
    String tags;
    DateTime createdAt;
    int productType;
    int unitPrice;
    int minQty;
    String endDate;
    List<dynamic> likeProducts;
    User user;

    factory AlltimeProduct.fromJson(Map<String, dynamic> json) => AlltimeProduct(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        addedBy: json["added_by"],
        description: json["description"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        thumbnailImg: json["thumbnail_img"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["created_at"]),
        productType: json["product_type"],
        unitPrice: json["unit_price"],
        minQty: json["min_qty"],
        endDate: json["end_date"],
        likeProducts: List<dynamic>.from(json["like_products"].map((x) => x)),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "added_by": addedBy,
        "description": description,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "thumbnail_img": thumbnailImg,
        "tags": tags,
        "created_at": createdAt.toIso8601String(),
        "product_type": productType,
        "unit_price": unitPrice,
        "min_qty": minQty,
        "end_date": endDate,
        "like_products": List<dynamic>.from(likeProducts.map((x) => x)),
        "user": user.toJson(),
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
    dynamic profilePic;

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
