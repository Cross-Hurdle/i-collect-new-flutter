// To parse this JSON data, do
//
//     final productUploadResponse = productUploadResponseFromJson(jsonString);

import 'dart:convert';

ProductUploadResponse productUploadResponseFromJson(String str) => ProductUploadResponse.fromJson(json.decode(str));

String productUploadResponseToJson(ProductUploadResponse data) => json.encode(data.toJson());

class ProductUploadResponse {
    ProductUploadResponse({
      required  this.result,
      required  this.message,
      required  this.data,
    });

    bool result;
    String message;
    Data data;

    factory ProductUploadResponse.fromJson(Map<String, dynamic> json) => ProductUploadResponse(
        result: json["result"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
      required  this.id,
       required this.name,
      required  this.productType,
      required  this.userId,
      required  this.tags,
      required  this.thumbnailImg,
      required  this.addedBy,
      required  this.description,
      required  this.unitPrice,
      required  this.minQty,
      required  this.photos,
       required this.endDate,
        required this.sellerAddress,
    });

    int id;
    String name;
    String productType;
    String userId;
    String tags;
    String thumbnailImg;
    String addedBy;
    String description;
    String unitPrice;
    String minQty;
    List<String> photos;
    String endDate;
    String sellerAddress;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        productType: json["product_type"],
        userId: json["user_id"],
        tags: json["tags"],
        thumbnailImg: json["thumbnail_img"],
        addedBy: json["added_by"],
        description: json["description"],
        unitPrice: json["unit_price"],
        minQty: json["min_qty"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        endDate: json["end_date"],
        sellerAddress: json["seller_address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_type": productType,
        "user_id": userId,
        "tags": tags,
        "thumbnail_img": thumbnailImg,
        "added_by": addedBy,
        "description": description,
        "unit_price": unitPrice,
        "min_qty": minQty,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "end_date": endDate,
        "seller_address": sellerAddress,
    };
}
