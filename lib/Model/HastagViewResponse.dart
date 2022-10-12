// To parse this JSON data, do
//
//     final hastagViewResponse = hastagViewResponseFromJson(jsonString);

import 'dart:convert';

HastagViewResponse hastagViewResponseFromJson(String str) => HastagViewResponse.fromJson(json.decode(str));

String hastagViewResponseToJson(HastagViewResponse data) => json.encode(data.toJson());

class HastagViewResponse {
    HastagViewResponse({
        required this.username,
        required this.hashtag,
    });

    String username;
    String hashtag;

    factory HastagViewResponse.fromJson(Map<String, dynamic> json) => HastagViewResponse(
        username: json["Username"],
        hashtag: json["Hashtag"],
    );

    Map<String, dynamic> toJson() => {
        "Username": username,
        "Hashtag": hashtag,
    };
}
