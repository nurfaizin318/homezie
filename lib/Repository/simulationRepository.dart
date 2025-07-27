
import 'package:homzie/Config/apiPath.dart';
import 'package:homzie/Service/api.dart';
import 'package:homzie/Utils/GlobalModel/base_response.dart';

class SimmulationRepository {
  SimmulationRepository._();
  final service = Services.instance;

  static final instance = SimmulationRepository._();

  Future<BaseResponse> simulate(Map<String,dynamic> data) async {
    try {
      final response = await service.post(ApiPaths.simulation,data: data);
      return response;
    } catch (error) {
      rethrow;
    }
  }


}
