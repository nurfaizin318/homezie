import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:homzie/Module/Detail/model.dart';
import 'package:homzie/Repository/detailRepository.dart';
import 'package:homzie/Theme/appColors.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';

class DetailController extends GetxController {
  final detailRepo = Detailrepository.instance;
  final Rxn<DetailEntity> detail = Rxn<DetailEntity>();
  RxBool isloadDetail = true.obs;
  RxString homeId = ''.obs;
  List<DetailEntity> houseIds = [];
  RxBool isExist = false.obs;

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

      getPropertyList();
    }
  }

  void getDetail(String id) async {
    final result = await detailRepo.getDetail(id);

    if (result.success) {
      detail.value = DetailEntity.fromJson(result.data);
      isloadDetail.value = false;
    } else {
      isloadDetail.value = false;
      print("Error fetching detail : ${result.message}");
    }
  }

  void addProperty() {
    if (detail.value != null) {
      houseIds.add(detail.value!);
    }

    final jsonString = jsonEncode(houseIds.map((e) => e.toJson()).toList());

    Storage.save(StorageKey.AddProperty.value, jsonString);

    getPropertyList();
    Get.snackbar(
      'Sukses',
      'Data berhasil di simpan',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.success,
      colorText: AppColors.background,
    );
  }

  void deleteProperty() {
    houseIds.removeWhere((item) => item.id == homeId.value);
    final jsonString = jsonEncode(houseIds.map((e) => e.toJson()).toList());
    Storage.save(StorageKey.AddProperty.value, jsonString);
    getPropertyList();
    Get.snackbar(
      'Sukses',
      'Data berhasil di hapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.error,
      colorText: AppColors.background,
    );
  }

  void getPropertyList() {

    var houseList = Storage.get(StorageKey.AddProperty.value);
    if (houseList != null && houseList is String && houseList.isNotEmpty) {
      // Parse the stored string as a List of DetailEntity
      final List<dynamic> jsonList = jsonDecode(houseList);

      houseIds =
          jsonList
              .map(
                (item) =>
                    DetailEntity.fromJson(Map<String, dynamic>.from(item)),
              )
              .toList();

      isExist.value = houseIds.any((item) => item.id == homeId.value);
    }
  }
}
