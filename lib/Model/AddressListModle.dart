// To parse this JSON data, do
//
//     final addressList = addressListFromJson(jsonString);

import 'dart:convert';

AddressList addressListFromJson(String str) => AddressList.fromJson(json.decode(str));

String addressListToJson(AddressList data) => json.encode(data.toJson());

class AddressList {
    AddressList({
        required this.addressList,
    });

    List<AddressListElement> addressList;

    factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
        addressList: List<AddressListElement>.from(json["Address_List"].map((x) => AddressListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Address_List": List<dynamic>.from(addressList.map((x) => x.toJson())),
    };
}

class AddressListElement {
    AddressListElement({
        required this.id,
        required this.userId,
        required this.name,
        required this.address,
        required this.phone,
        required this.country,
        required this.city,
        required this.postalCode,
    });

    int id;
    int userId;
    String name;
    String address;
    String phone;
    String country;
    String city;
    String postalCode;

    factory AddressListElement.fromJson(Map<String, dynamic> json) => AddressListElement(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"] == null ? null : json["phone"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "address": address,
        "phone": phone == '' ? null : phone,
        "country": country,
        "city": city,
        "postal_code": postalCode,
    };
}
