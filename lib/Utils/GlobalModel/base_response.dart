// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse{
  bool success;
  int code;
  String message;
  dynamic data;
  ErrorDetail? errors;
  

  BaseResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
        errors:  json['errors'] != null
            ? ErrorDetail.fromJson(json['errors'])
            : null  ,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data,
        "errors": errors?.toJson() ,
      };
}

class ErrorDetail {
  final List<dynamic>? formErrors;
  final Map<String, List<String>>? fieldErrors;

  ErrorDetail({
    this.formErrors,
    this.fieldErrors,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) => ErrorDetail(
    
        formErrors: json['formErrors'] ?? [],
        fieldErrors: json['fieldErrors'] != null
            ? Map<String, List<String>>.from(json['fieldErrors'].map(
                (key, value) => MapEntry(
                    key, List<String>.from(value.map((e) => e.toString()))),
              ))
            : null,
      );

        Map<String, dynamic> toJson() => {
        "formErrors": formErrors,
        "fieldErrors": fieldErrors,
       
    };
    
}