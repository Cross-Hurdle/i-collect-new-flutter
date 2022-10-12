// To parse this JSON data, do
//
//     final notificationStatusUpdate = notificationStatusUpdateFromJson(jsonString);

import 'dart:convert';

NotificationStatusUpdate notificationStatusUpdateFromJson(String str) => NotificationStatusUpdate.fromJson(json.decode(str));

String notificationStatusUpdateToJson(NotificationStatusUpdate data) => json.encode(data.toJson());

class NotificationStatusUpdate {
    NotificationStatusUpdate({
        required this.deliveryNotification,
        required this.inboxNotification,
        required this.groupNotification,
    });

    bool deliveryNotification;
    bool inboxNotification;
    bool groupNotification;

    factory NotificationStatusUpdate.fromJson(Map<String, dynamic> json) => NotificationStatusUpdate(
        deliveryNotification: json["delivery_notification"],
        inboxNotification: json["inbox_notification"],
        groupNotification: json["group_notification"],
    );

    Map<String, dynamic> toJson() => {
        "delivery_notification": deliveryNotification,
        "inbox_notification": inboxNotification,
        "group_notification": groupNotification,
    };
}
