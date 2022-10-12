// To parse this JSON data, do
//
//     final orderCancelResponse = orderCancelResponseFromJson(jsonString);

import 'dart:convert';

CollectionDataResponse collectionDataResponseFromJson(String str) => CollectionDataResponse.fromJson(json.decode(str));

String collectionDataResponseToJson(CollectionDataResponse data) => json.encode(data.toJson());

class CollectionDataResponse {
    CollectionDataResponse({
       required this.result,
       required this.message,
    });

    bool result;
    String message;

    factory CollectionDataResponse.fromJson(Map<String, dynamic> json) => CollectionDataResponse(
        result: json["result"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
    };
}