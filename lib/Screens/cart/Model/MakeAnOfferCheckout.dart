// To parse this JSON data, do
//
//     final makeAnOfferCheckoutModle = makeAnOfferCheckoutModleFromJson(jsonString);

import 'dart:convert';

MakeAnOfferCheckoutModle makeAnOfferCheckoutModleFromJson(String str) => MakeAnOfferCheckoutModle.fromJson(json.decode(str));

String makeAnOfferCheckoutModleToJson(MakeAnOfferCheckoutModle data) => json.encode(data.toJson());

class MakeAnOfferCheckoutModle {
    MakeAnOfferCheckoutModle({
      required  this.product,
      required  this.address,
      required  this.beforePrice,
      required  this.makePrice,
      required  this.status,
    });

    List<Product> product;
    List<Address> address;
    int beforePrice;
    int makePrice;
    int status;

    factory MakeAnOfferCheckoutModle.fromJson(Map<String, dynamic> json) => MakeAnOfferCheckoutModle(
        product: List<Product>.from(json["Product"].map((x) => Product.fromJson(x))),
        address: List<Address>.from(json["Address"].map((x) => Address.fromJson(x))),
        beforePrice: json["Before_Price"],
        makePrice: json["Make_price"],
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Product": List<dynamic>.from(product.map((x) => x.toJson())),
        "Address": List<dynamic>.from(address.map((x) => x.toJson())),
        "Before_Price": beforePrice,
        "Make_price": makePrice,
        "Status": status,
    };
}

class Address {
    Address({
      required  this.id,
      required  this.name,
      required  this.userId,
      required  this.address,
      required  this.city,
      required  this.country,
       required this.phone,
       required this.postalCode,
    });

    int id;
    String name;
    int userId;
    String address;
    String city;
    String country;
    String phone;
    String postalCode;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        phone: json["phone"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "address": address,
        "city": city,
        "country": country,
        "phone": phone,
        "postal_code": postalCode,
    };
}

class Product {
    Product({
       required this.id,
      required  this.name,
      required  this.userId,
      required  this.thumbnailImg,
      required  this.unitPrice,
        required this.endDate,
    });

    int id;
    String name;
    int userId;
    String thumbnailImg;
    int unitPrice;
    String endDate;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        thumbnailImg: json["thumbnail_img"],
        unitPrice: json["unit_price"],
        endDate: json["end_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "thumbnail_img": thumbnailImg,
        "unit_price": unitPrice,
        "end_date": endDate,
    };
}
