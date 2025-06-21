
import 'package:homzie/Config/apiPath.dart';
import 'package:homzie/Service/api.dart';
import 'package:homzie/Utils/GlobalModel/base_response.dart';

class Homerepository {
  Homerepository._();
  final service = Services.instance;

  static final instance = Homerepository._();

  Future<BaseResponse> getBalance(String id) async {
    try {
      final response = await service.get(ApiPaths.balance + id,);
      return response;
    } catch (error) {
      rethrow;
    }
  }


}
