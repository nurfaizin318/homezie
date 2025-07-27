import 'dart:convert';

import 'package:get/get.dart';
import 'package:homzie/Module/Detail/model.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';

class PropertyListController extends GetxController {
  Rx<List<DetailEntity>> houseIds = Rx<List<DetailEntity>>([]);

  void navigateToSimulation() {
    Get.toNamed('/simulation',arguments: {"houseIds": houseIds.value});
  }

  @override
  void onInit() {
    getPropertyList();
    super.onInit();
    // Additional initialization if needed
  }

  void getPropertyList() {
    var houseList = Storage.get(StorageKey.AddProperty.value);
    if (houseList != null && houseList is String && houseList.isNotEmpty) {
      // Parse the stored string as a List of DetailEntity
      final List<dynamic> jsonList = jsonDecode(houseList);

      houseIds.value =
          jsonList
              .map(
                (item) =>
                    DetailEntity.fromJson(Map<String, dynamic>.from(item)),
              )
              .toList();

      print(jsonList);
    }
  }

  void navigateToDetail(String id){
    print(id);
      Get.toNamed('/detail', arguments: {'id': id});
  }
}
