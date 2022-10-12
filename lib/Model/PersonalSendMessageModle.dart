// To parse this JSON data, do
//
//     final personalSendMessage = personalSendMessageFromJson(jsonString);

import 'dart:convert';

PersonalSendMessage personalSendMessageFromJson(String str) => PersonalSendMessage.fromJson(json.decode(str));

String personalSendMessageToJson(PersonalSendMessage data) => json.encode(data.toJson());

class PersonalSendMessage {
    PersonalSendMessage({
        required this.status,
    });

    String status;

    factory PersonalSendMessage.fromJson(Map<String, dynamic> json) => PersonalSendMessage(
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
    };
}
