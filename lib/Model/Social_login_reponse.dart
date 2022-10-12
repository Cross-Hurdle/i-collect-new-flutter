// // To parse this JSON data, do
// //
// //     final socialLoginresponse = socialLoginresponseFromJson(jsonString);

// import 'dart:convert';

// SocialLoginresponse socialLoginresponseFromJson(String str) => SocialLoginresponse.fromJson(json.decode(str));

// String socialLoginresponseToJson(SocialLoginresponse data) => json.encode(data.toJson());

// class SocialLoginresponse {
//     SocialLoginresponse({
//         required this.result,
//         required this.message,
//         required this.userData,
//         required this.token,
//     });

//     bool result;
//     String message;
//     UserData userData;
//     String token;

//     factory SocialLoginresponse.fromJson(Map<String, dynamic> json) => SocialLoginresponse(
//         result: json["result"],
//         message: json["message"],
//         userData: UserData.fromJson(json["user_data"]),
//         token: json["token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "result": result,
//         "message": message,
//         "user_data": userData.toJson(),
//         "token": token,
//     };
// }

// class UserData {
//     UserData({
//         required this.id,
//         required this.email,
//         required this.name,
//         this.phone,
//         this.address,
//         required this.status,
//         this.verificationCode,
//         required this.providerId,
//         required this.emailVerifiedAt,
//         this.country,
//         this.city,
//         this.postalCode,
//     });

//     int id;
//     String email;
//     String name;
//     dynamic phone;
//     dynamic address;
//     String status;
//     dynamic verificationCode;
//     String providerId;
//     DateTime emailVerifiedAt;
//     dynamic country;
//     dynamic city;
//     dynamic postalCode;

//     factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         id: json["id"],
//         email: json["email"],
//         name: json["name"],
//         phone: json["phone"],
//         address: json["address"],
//         status: json["status"],
//         verificationCode: json["verification_code"],
//         providerId: json["provider_id"],
//         emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
//         country: json["country"],
//         city: json["city"],
//         postalCode: json["postal_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "name": name,
//         "phone": phone,
//         "address": address,
//         "status": status,
//         "verification_code": verificationCode,
//         "provider_id": providerId,
//         "email_verified_at": emailVerifiedAt.toIso8601String(),
//         "country": country,
//         "city": city,
//         "postal_code": postalCode,
//     };
// }
// To parse this JSON data, do
//
//     final socialLoginresponse = socialLoginresponseFromJson(jsonString);

import 'dart:convert';

SocialLoginresponse socialLoginresponseFromJson(String str) => SocialLoginresponse.fromJson(json.decode(str));

String socialLoginresponseToJson(SocialLoginresponse data) => json.encode(data.toJson());

class SocialLoginresponse {
    SocialLoginresponse({
        required this.result,
        required this.message,
        required this.userData,
        required this.token,
    });

    bool result;
    String message;
    UserData userData;
    String token;

    factory SocialLoginresponse.fromJson(Map<String, dynamic> json) => SocialLoginresponse(
        result: json["result"],
        message: json["message"],
        userData: UserData.fromJson(json["user_data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "user_data": userData.toJson(),
        "token": token,
    };
}

class UserData {
    UserData({
        required this.id,
        required this.email,
        required this.name,
        this.phone,
        this.address,
        required this.status,
        this.verificationCode,
        required this.providerId,
        required this.emailVerifiedAt,
        this.country,
        this.city,
        this.postalCode,
    });

    int id;
    String email;
    String name;
    dynamic phone;
    dynamic address;
    String status;
    dynamic verificationCode;
    String providerId;
    DateTime emailVerifiedAt;
    dynamic country;
    dynamic city;
    dynamic postalCode;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        status: json["status"],
        verificationCode: json["verification_code"],
        providerId: json["provider_id"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "address": address,
        "status": status,
        "verification_code": verificationCode,
        "provider_id": providerId,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "country": country,
        "city": city,
        "postal_code": postalCode,
    };
}
