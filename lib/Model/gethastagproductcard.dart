// To parse this JSON data, do
//
//     final hastagProductCard = hastagProductCardFromJson(jsonString);

import 'dart:convert';

HastagProductCard hastagProductCardFromJson(String str) => HastagProductCard.fromJson(json.decode(str));

String hastagProductCardToJson(HastagProductCard data) => json.encode(data.toJson());

class HastagProductCard {
    HastagProductCard({
        required this.hashtag,
    });

    String hashtag;

    factory HastagProductCard.fromJson(Map<String, dynamic> json) => HastagProductCard(
        hashtag: json["Hashtag"],
    );

    Map<String, dynamic> toJson() => {
        "Hashtag": hashtag,
    };
}
