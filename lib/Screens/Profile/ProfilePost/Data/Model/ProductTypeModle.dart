// To parse this JSON data, do
//
//     final productTypeModle = productTypeModleFromJson(jsonString);

import 'dart:convert';

ProductTypeModle productTypeModleFromJson(String str) => ProductTypeModle.fromJson(json.decode(str));

String productTypeModleToJson(ProductTypeModle data) => json.encode(data.toJson());

class ProductTypeModle {
    ProductTypeModle({
        required this.productType,
        required this.message,
        required this.status,
    });

    int productType;
    String message;
    bool status;

    factory ProductTypeModle.fromJson(Map<String, dynamic> json) => ProductTypeModle(
        productType: json["product_type"],
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "product_type": productType,
        "message": message,
        "status": status,
    };
}
