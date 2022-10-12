// To parse this JSON data, do
//
//     final groupPhotoDataResponse = groupPhotoDataResponseFromJson(jsonString);

import 'dart:convert';

GroupPhotoDataResponse groupPhotoDataResponseFromJson(String str) => GroupPhotoDataResponse.fromJson(json.decode(str));

String groupPhotoDataResponseToJson(GroupPhotoDataResponse data) => json.encode(data.toJson());

class GroupPhotoDataResponse {
    GroupPhotoDataResponse({
        required this.data,
    });

    List<Datum> data;

    factory GroupPhotoDataResponse.fromJson(Map<String, dynamic> json) => GroupPhotoDataResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.photos,
    });

    int id;
    String photos;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        photos: json["photos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photos": photos,
    };
}
