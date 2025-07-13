
import 'package:homzie/Config/apiPath.dart';
import 'package:homzie/Service/api.dart';
import 'package:homzie/Utils/GlobalModel/base_response.dart';

class Detailrepository {
  Detailrepository._();
  final service = Services.instance;

  static final instance = Detailrepository._();

  Future<BaseResponse> getDetail(String id) async {
    try {

      final response = await service.get("${ApiPaths.houses}/$id");
      return response;
    } catch (error) {
      rethrow;
    }
  }


}
