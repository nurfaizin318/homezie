import 'dart:async';
import 'package:alice/alice.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:homzie/Config/apiPath.dart';
import 'package:homzie/Service/dioException.dart';
import 'package:homzie/Service/dioInterceptor.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';
import 'package:homzie/Utils/GlobalModel/base_response.dart';


class Services {
  Services._();
  late Alice alice = Alice();
  static final instance = Services._();
  Timer? timer;
  CancelToken? cancelToken;

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: ApiPaths.baseUrl,
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 10),
    validateStatus: (status) {
      return status! < 500;
    },
  );
  Dio dio = Dio(baseOptions);

  /// kalo mau tanpa bearer pakai ini
  Services clearToken() {
    dio.interceptors.add(AuthInterceptor(""));
    return this;
  }
  
  Services() {
 
    dio.interceptors.add(alice.getDioInterceptor());
  }

  ///Get Method
  Future<BaseResponse> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? useToken}) async {
    this.cancelToken = cancelToken;

    if (useToken != null && useToken == true) {
      String token = Storage.getToken();
      baseOptions.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      // print(response.data);

      BaseResponse baseResponse = BaseResponse.fromJson(response.data);

      return baseResponse;
    } on DioException catch (e) {
      throw DioCustomException.fromDioError(e);
    }
  }

  ///Post Method[POST]
  Future<BaseResponse> post(
    String path, {
    data,
    bool? useToken = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? isDisableBottomSheet,
     model
  }) async {
    this.cancelToken = cancelToken;

    if (useToken != null && useToken) {
      String token = Storage.getToken();
      baseOptions.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
  
      try {
        print(response.data);
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);

        return baseResponse;
      } catch (e) {
        rethrow;
      }
    } on DioException catch (e) {
      throw DioCustomException.fromDioError(e);
    }
  }

  //Put Method
  Future<Map<String, dynamic>> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      throw DioException;
    }
  }

  //Delete Method
  Future<Map<String, dynamic>> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  void cancelRequest() {
    try {
      cancelToken?.cancel("Permintaan dibatalkan");
      if (cancelToken!.isCancelled) {
        // ButtomSheetReceiveTimeout().close();
      } else {
        debugPrint("CancelToken tidak berhasil dibatalkan");
      }
      debugPrint('cancelToken ${cancelToken!.cancelError.toString()}');
    } catch (error) {
      rethrow;
    }
  }
}
