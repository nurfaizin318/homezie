import 'dart:convert';

import 'package:get/get.dart';
import 'package:homzie/Module/Home/model.dart';
import 'package:homzie/Module/Login/model.dart';
import 'package:homzie/Repository/homeRepository.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';

class HomeController extends GetxController {
  RxBool obsecureTestStatus = true.obs;
  final Rx<LoginModel?> profile = Rx<LoginModel?>(null);
  final Rx<List<HouseEntity>> houseList = Rx<List<HouseEntity>>([]);
  List<Map<String, dynamic>> houses = [
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 30},
    {'name': 'Charlie', 'age': 28},
    {'name': 'Charlie', 'age': 28},
  ];
  RxBool isLoadingHouse = true.obs;

  var homeRepository = Homerepository.instance;

  void moveToRegister() {
    Get.toNamed('/register');
  }

  void moveToHomePage() {
    Get.toNamed('/layout');
  }

  void navigateToSelectCity() {
    Get.toNamed('/select-city');
  }

  void getDataFromStorage() {
    var jsonString = Storage.get(StorageKey.Profile.value);
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    LoginModel model = LoginModel.fromJson(jsonMap);

    profile.value = model;
  }

  void getHouseList() async {
    final result = await homeRepository.getHouseList();

    if (result.success) {
      var data =
          (result.data as List)
              .map((house) => HouseEntity.fromJson(house))
              .toList();
      houseList.value = data.sublist(0, 4);
    } else {
      print("Error fetching house list: ${result.message}");
    }
    isLoadingHouse.value = false;
  }

  @override
  void onInit() {
    getDataFromStorage();
    getHouseList();
    // getBalance(profile.value?.id ?? "");
    super.onInit();
  }
}
