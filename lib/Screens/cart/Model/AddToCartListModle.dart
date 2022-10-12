// To parse this JSON data, do
//
//     final addToCartListModle = addToCartListModleFromJson(jsonString);

import 'dart:convert';

AddToCartListModle addToCartListModleFromJson(String str) => AddToCartListModle.fromJson(json.decode(str));

String addToCartListModleToJson(AddToCartListModle data) => json.encode(data.toJson());

class AddToCartListModle {
    AddToCartListModle({
      required  this.cartData,
    });

    List<CartDatum> cartData;

    factory AddToCartListModle.fromJson(Map<String, dynamic> json) => AddToCartListModle(
        cartData: List<CartDatum>.from(json["cart_data"].map((x) => CartDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cart_data": List<dynamic>.from(cartData.map((x) => x.toJson())),
    };
}

class CartDatum {
    CartDatum({
      required  this.data,
    });

    Data data;

    factory CartDatum.fromJson(Map<String, dynamic> json) => CartDatum(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.name,
      required  this.price,
      required  this.profile,
      required  this.id,
      required  this.product,
    });

    String name;
    int price;
    String profile;
    int id;
    List<Product> product;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["Name"],
        price: json["price"],
        profile: json["profile"],
        id: json["Id"],
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "price": price,
        "profile": profile,
        "Id": id,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    Product({
      required  this.id,
      required  this.name,
       required this.userId,
       required this.thumbnailImg,
       required this.unitPrice,
    });

    int id;
    String name;
    int userId;
    String thumbnailImg;
    int unitPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        thumbnailImg: json["thumbnail_img"],
        unitPrice: json["unit_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "thumbnail_img": thumbnailImg,
        "unit_price": unitPrice,
    };
}
