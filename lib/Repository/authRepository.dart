

import 'package:homzie/Config/apiPath.dart';
import 'package:homzie/Service/api.dart';
import 'package:homzie/Utils/GlobalModel/base_response.dart';

class Authrepository {
  Authrepository._();
  final service = Services.instance;

  static final instance = Authrepository._();

  Future<BaseResponse> login(String email, String password) async {
    Map<String, String> loginForm = {
      "email": email,
      "password": password,
    };
    try {
      final response = await service.post(ApiPaths.login,
          data: loginForm, isDisableBottomSheet: true, useToken: false);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<BaseResponse> register(Map<String, String> data) async {
    try {
      final response =
          await service.post(ApiPaths.register, useToken: false, data: data);

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
