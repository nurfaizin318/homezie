// To parse this JSON data, do
//
//     final houseEntity = houseEntityFromJson(jsonString);

import 'dart:convert';

HouseEntity houseEntityFromJson(String str) => HouseEntity.fromJson(json.decode(str));

String houseEntityToJson(HouseEntity data) => json.encode(data.toJson());

class HouseEntity {
    String id;
    String name;
    String price;
    String location;
    String imageUrl;
    String latitude;
    String longtitude;

    HouseEntity({
        required this.id,
        required this.name,
        required this.price,
        required this.location,
        required this.imageUrl,
        required this.latitude,
        required this.longtitude,
    });

    factory HouseEntity.fromJson(Map<String, dynamic> json) => HouseEntity(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        location: json["location"],
        imageUrl: json["image_url"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "location": location,
        "image_url": imageUrl,
        "latitude": latitude,
        "longtitude": longtitude,
    };
}
