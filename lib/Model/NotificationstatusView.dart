// To parse this JSON data, do
//
//     final notificationStatusView = notificationStatusViewFromJson(jsonString);

import 'dart:convert';

NotificationStatusView notificationStatusViewFromJson(String str) => NotificationStatusView.fromJson(json.decode(str));

String notificationStatusViewToJson(NotificationStatusView data) => json.encode(data.toJson());

class NotificationStatusView {
    NotificationStatusView({
        required this.deliveryNotification,
        required this.inboxNotification,
        required this.groupNotification,
    });

    String deliveryNotification;
    String inboxNotification;
    String groupNotification;

    factory NotificationStatusView.fromJson(Map<String, dynamic> json) => NotificationStatusView(
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
