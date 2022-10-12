// To parse this JSON data, do
//
//     final onetoonConnectionResponse = onetoonConnectionResponseFromJson(jsonString);

import 'dart:convert';

OnetoonConnectionResponse onetoonConnectionResponseFromJson(String str) => OnetoonConnectionResponse.fromJson(json.decode(str));

String onetoonConnectionResponseToJson(OnetoonConnectionResponse data) => json.encode(data.toJson());

class OnetoonConnectionResponse {
    OnetoonConnectionResponse({
        required this.result,
        required this.id,
        required this.status,
    });

    bool result;
    int id;
    String status;

    factory OnetoonConnectionResponse.fromJson(Map<String, dynamic> json) => OnetoonConnectionResponse(
        result: json["result"],
        id: json["id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "id": id,
        "status": status,
    };
}
