import 'package:get/get.dart';
import 'package:homzie/Module/Detail/model.dart';
import 'package:homzie/Repository/detailRepository.dart';

class DetailController extends GetxController {
  final detailRepo = Detailrepository.instance;
  final Rxn<DetailEntity> detail = Rxn<DetailEntity>();
  RxBool isloadDetail = true.obs;
  RxString homeId = ''.obs;

  void navigateToPropertyList() {
    Get.toNamed('/property-list');
  }

  @override
  void onInit() {
    super.onInit();
    // Get the id from navigation arguments
    if (Get.arguments != null && Get.arguments['id'] != null) {
      homeId.value = Get.arguments['id'];
      getDetail(homeId.value);
    }
  }

  void getDetail(String id) async {
    final result = await detailRepo.getDetail(id);
    detail.value = DetailEntity.fromJson(result.data);
    if (result.success) {
      print(result);
    } else {
      print("Error fetching house list: ${result.message}");
    }
    isloadDetail.value = false;
  }
}
