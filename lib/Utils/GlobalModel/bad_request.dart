// To parse this JSON data, do
//
//     final badRequestModel = badRequestModelFromJson(jsonString);

import 'dart:convert';

BadRequestModel badRequestModelFromJson(String str) => BadRequestModel.fromJson(json.decode(str));

String badRequestModelToJson(BadRequestModel data) => json.encode(data.toJson());

class BadRequestModel {
    bool success;
    String message;
    int code;
    Errors errors;
    DateTime timestamp;
    String path;

    BadRequestModel({
        required this.success,
        required this.message,
        required this.code,
        required this.errors,
        required this.timestamp,
        required this.path,
    });

    factory BadRequestModel.fromJson(Map<String, dynamic> json) => BadRequestModel(
        success: json["success"],
        message: json["message"],
        code: json["code"],
        errors: Errors.fromJson(json["errors"]),
        timestamp: DateTime.parse(json["timestamp"]),
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "code": code,
        "errors": errors.toJson(),
        "timestamp": timestamp.toIso8601String(),
        "path": path,
    };
}

class Errors {
    List<dynamic> formErrors;
    FieldErrors fieldErrors;

    Errors({
        required this.formErrors,
        required this.fieldErrors,
    });

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        formErrors: List<dynamic>.from(json["formErrors"].map((x) => x)),
        fieldErrors: FieldErrors.fromJson(json["fieldErrors"]),
    );

    Map<String, dynamic> toJson() => {
        "formErrors": List<dynamic>.from(formErrors.map((x) => x)),
        "fieldErrors": fieldErrors.toJson(),
    };
}

class FieldErrors {
    List<String> phoneNumber;

    FieldErrors({
        required this.phoneNumber,
    });

    factory FieldErrors.fromJson(Map<String, dynamic> json) => FieldErrors(
        phoneNumber: List<String>.from(json["phone_number"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "phone_number": List<dynamic>.from(phoneNumber.map((x) => x)),
    };
}
