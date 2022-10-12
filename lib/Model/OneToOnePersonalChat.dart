// To parse this JSON data, do
//
//     final oneToOnePersonalChatDataResponse = oneToOnePersonalChatDataResponseFromJson(jsonString);

import 'dart:convert';

OneToOnePersonalChatDataResponse oneToOnePersonalChatDataResponseFromJson(String str) => OneToOnePersonalChatDataResponse.fromJson(json.decode(str));

String oneToOnePersonalChatDataResponseToJson(OneToOnePersonalChatDataResponse data) => json.encode(data.toJson());

class OneToOnePersonalChatDataResponse {
    OneToOnePersonalChatDataResponse({
        required this.data,
    });

    List<Datum> data;

    factory OneToOnePersonalChatDataResponse.fromJson(Map<String, dynamic> json) => OneToOnePersonalChatDataResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.chat,
        required this.fromUserId,
        required this.toUserId,
        required this.createdAt,
    });

    int id;
    String chat;
    int fromUserId;
    int toUserId;
    DateTime createdAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        chat: json["chat"],
        fromUserId: json["fromUserId"],
        toUserId: json["toUserId"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chat": chat,
        "fromUserId": fromUserId,
        "toUserId": toUserId,
        "created_at": createdAt.toIso8601String(),
    };
}
