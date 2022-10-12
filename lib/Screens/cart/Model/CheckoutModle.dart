// To parse this JSON data, do
//
//     final checkoutSummaryModle = checkoutSummaryModleFromJson(jsonString);

import 'dart:convert';

CheckoutSummaryModle checkoutSummaryModleFromJson(String str) => CheckoutSummaryModle.fromJson(json.decode(str));

String checkoutSummaryModleToJson(CheckoutSummaryModle data) => json.encode(data.toJson());

class CheckoutSummaryModle {
    CheckoutSummaryModle({
    required    this.cartSummary,
    });

    List<CartSummary> cartSummary;

    factory CheckoutSummaryModle.fromJson(Map<String, dynamic> json) => CheckoutSummaryModle(
        cartSummary: List<CartSummary>.from(json["Cart_Summary"].map((x) => CartSummary.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Cart_Summary": List<dynamic>.from(cartSummary.map((x) => x.toJson())),
    };
}

class CartSummary {
    CartSummary({
      required  this.product,
      required  this.buyerAddress,
      required  this.SellerAddress,
     required   this.parcel,
      required  this.tax,
      required  this.shippingCost,
      required  this.discount,
      required  this.grandTotal,
      required  this.couponCode,
      required  this.couponApplied,
      required  this.sellerIds,
      required  this.status,
    });

    List<Product> product;
    List<BuyerAddress> buyerAddress;
    List<BuyerAddress> SellerAddress;
    List<Parcel> parcel;
    int tax;
    int shippingCost;
    int discount;
    int grandTotal;
    dynamic couponCode;
    bool couponApplied;
    int sellerIds;
    int status;

    factory CartSummary.fromJson(Map<String, dynamic> json) => CartSummary(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        buyerAddress: List<BuyerAddress>.from(json["Buyer_Address"].map((x) => BuyerAddress.fromJson(x))),
        SellerAddress: List<BuyerAddress>.from(json["Seller_Address"].map((x) => BuyerAddress.fromJson(x))),
        parcel: List<Parcel>.from(json["Parcel"].map((x) => Parcel.fromJson(x))),
        tax: json["tax"],
        shippingCost: json["shipping_cost"],
        discount: json["discount"],
        grandTotal: json["grand_total"],
        couponCode: json["coupon_code"],
        couponApplied: json["coupon_applied"],
        sellerIds: json["Seller_ids"],
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "Buyer_Address2": List<dynamic>.from(buyerAddress.map((x) => x.toJson())),
        "hSeller_Address1": List<dynamic>.from(SellerAddress.map((x) => x.toJson())),
        "Parcel": List<dynamic>.from(parcel.map((x) => x.toJson())),
        "tax": tax,
        "shipping_cost": shippingCost,
        "discount": discount,
        "grand_total": grandTotal,
        "coupon_code": couponCode,
        "coupon_applied": couponApplied,
        "Seller_ids": sellerIds,
        "Status": status,
    };
}

class BuyerAddress {
    BuyerAddress({
      required  this.id,
     required   this.name,
      required  this.userId,
      required  this.address,
      required  this.city,
      required  this.country,
      required  this.phone,
      required  this.postalCode,
    });

    int id;
    String name;
    int userId;
    String address;
    String city;
    String country;
    String phone;
    String postalCode;

    factory BuyerAddress.fromJson(Map<String, dynamic> json) => BuyerAddress(
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

class Parcel {
    Parcel({
      required  this.id,
      required  this.weight,
      required  this.height,
      required  this.width,
      required  this.length,
      required  this.productId,
      required  this.userId,
    });

    int id;
    String weight;
    String height;
    String width;
    dynamic length;
    int productId;
    int userId;

    factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
        id: json["id"],
        weight: json["weight"],
        height: json["height"],
        width: json["width"],
        length: json["length"],
        productId: json["product_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "height": height,
        "width": width,
        "length": length,
        "product_id": productId,
        "user_id": userId,
    };
}

class Product {
    Product({
      required  this.id,
      required  this.name,
      required  this.userId,
       required this.thumbnailImg,
       required this.unitPrice,
        required this.sellerAddress,
    });

    int id;
    String name;
    int userId;
    String thumbnailImg;
    int unitPrice;
    String sellerAddress;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        thumbnailImg: json["thumbnail_img"],
        unitPrice: json["unit_price"],
        sellerAddress: json["seller_address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "thumbnail_img": thumbnailImg,
        "unit_price": unitPrice,
        "seller_address": sellerAddress,
    };
}
