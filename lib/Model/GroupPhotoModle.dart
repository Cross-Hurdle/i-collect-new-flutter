// To parse this JSON data, do
//
//     final groupImageDataResponse = groupImageDataResponseFromJson(jsonString);

import 'dart:convert';

GroupImageDataResponse groupImageDataResponseFromJson(String str) => GroupImageDataResponse.fromJson(json.decode(str));

String groupImageDataResponseToJson(GroupImageDataResponse data) => json.encode(data.toJson());

class GroupImageDataResponse {
    GroupImageDataResponse({
        required this.image,
    });

    List<Image> image;

    factory GroupImageDataResponse.fromJson(Map<String, dynamic> json) => GroupImageDataResponse(
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        required this.id,
        required this.photos,
        required this.status,
    });

    int id;
    String photos;
    int status;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        photos: json["photos"]==null?'':json["photos"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photos": photos==''?'':photos,
        "status": status,
    };
}
