// To parse this JSON data, do
//
//     final inboxPersonalChatDataResponse = inboxPersonalChatDataResponseFromJson(jsonString);

import 'dart:convert';

InboxPersonalChatDataResponse inboxPersonalChatDataResponseFromJson(String str) => InboxPersonalChatDataResponse.fromJson(json.decode(str));

String inboxPersonalChatDataResponseToJson(InboxPersonalChatDataResponse data) => json.encode(data.toJson());

class InboxPersonalChatDataResponse {
    InboxPersonalChatDataResponse({
        required this.userData,
    });

    List<UserDatum> userData;

    factory InboxPersonalChatDataResponse.fromJson(Map<String, dynamic> json) => InboxPersonalChatDataResponse(
        userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
    };
}

class UserDatum {
    UserDatum({
        required this.chat,
        required this.toUserId,
        required this.createdAt,
        required this.user,
    });

    String chat;
    int toUserId;
    DateTime createdAt;
    User user;

    factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        chat: json["chat"],
        toUserId: json["toUserId"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "chat": chat,
        "toUserId": toUserId,
        "created_at": createdAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.profilePic,
    });

    int id;
    String name;
    String profilePic;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic,
    };
}
