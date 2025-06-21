// To parse this JSON data, do
//
//     final getBalanceModel = getBalanceModelFromJson(jsonString);

import 'dart:convert';

GetBalanceModel getBalanceModelFromJson(String str) => GetBalanceModel.fromJson(json.decode(str));

String getBalanceModelToJson(GetBalanceModel data) => json.encode(data.toJson());

class GetBalanceModel {
    int balance = 00000000000;
    String id;

    GetBalanceModel({
        required this.balance,
        required this.id,
    });

    factory GetBalanceModel.fromJson(Map<String, dynamic> json) => GetBalanceModel(
        balance: json["balance"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
        "id": id,
    };
}
