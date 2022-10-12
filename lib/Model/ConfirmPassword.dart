// To parse this JSON data, do
//
//     final confirmpasswordResponse = confirmpasswordResponseFromJson(jsonString);

import 'dart:convert';

ConfirmpasswordResponse confirmpasswordResponseFromJson(String str) => ConfirmpasswordResponse.fromJson(json.decode(str));

String confirmpasswordResponseToJson(ConfirmpasswordResponse data) => json.encode(data.toJson());

class ConfirmpasswordResponse {
    ConfirmpasswordResponse({
        required this.result,
        required this.message,
        required this.userData,
    });

    bool result;
    String message;
    UserData userData;

    factory ConfirmpasswordResponse.fromJson(Map<String, dynamic> json) => ConfirmpasswordResponse(
        result: json["result"],
        message: json["message"],
        userData: UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "user_data": userData.toJson(),
    };
}

class UserData {
    UserData({
        required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.phone,
        required this.verificationCode,
        required this.status,
        this.providerId,
        this.emailVerifiedAt,
        this.address,
        this.country,
        this.city,
        this.postalCode,
    });

    int id;
    String email;
    String password;
    String name;
    String phone;
    String verificationCode;
    String status;
    dynamic providerId;
    dynamic emailVerifiedAt;
    dynamic address;
    dynamic country;
    dynamic city;
    dynamic postalCode;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        phone: json["phone"],
        verificationCode: json["verification_code"],
        status: json["status"],
        providerId: json["provider_id"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "verification_code": verificationCode,
        "status": status,
        "provider_id": providerId,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "country": country,
        "city": city,
        "postal_code": postalCode,
    };
}
