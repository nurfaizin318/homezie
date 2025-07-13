// To parse this JSON data, do
//
//     final detailEntity = detailEntityFromJson(jsonString);

import 'dart:convert';

DetailEntity detailEntityFromJson(String str) => DetailEntity.fromJson(json.decode(str));

String detailEntityToJson(DetailEntity data) => json.encode(data.toJson());

class DetailEntity {
    String id;
    String name;
    String price;
    int landArea;
    int buildingArea;
    int bedrooms;
    String location;
    String imageUrl;
    DateTime createdAt;
    String longtitude;
    String latitude;

    DetailEntity({
        required this.id,
        required this.name,
        required this.price,
        required this.landArea,
        required this.buildingArea,
        required this.bedrooms,
        required this.location,
        required this.imageUrl,
        required this.createdAt,
        required this.longtitude,
        required this.latitude,
    });

    factory DetailEntity.fromJson(Map<String, dynamic> json) => DetailEntity(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        landArea: json["land_area"],
        buildingArea: json["building_area"],
        bedrooms: json["bedrooms"],
        location: json["location"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        longtitude: json["longtitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "land_area": landArea,
        "building_area": buildingArea,
        "bedrooms": bedrooms,
        "location": location,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "longtitude": longtitude,
        "latitude": latitude,
    };
}
