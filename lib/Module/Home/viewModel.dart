import 'dart:convert';

import 'package:get/get.dart';
import 'package:homzie/Module/Home/model.dart';
import 'package:homzie/Module/Login/model.dart';
import 'package:homzie/Repository/homeRepository.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';


class HomeController extends GetxController {
  RxBool obsecureTestStatus = true.obs;
  final Rx<LoginModel?> profile = Rx<LoginModel?>(null);
  final Rx<GetBalanceModel?> balanceModel = Rx<GetBalanceModel?>(null);

  RxBool isLoadingBalance = true.obs;

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

  void getBalance(String id) async {
    final result = await homeRepository.getBalance(id);

    if (result.success) {
      balanceModel.value = GetBalanceModel.fromJson(result.data);
    }

    print(balanceModel.value?.id);
    isLoadingBalance.value = false;
  }

  @override
  void onInit() {
    // getDataFromStorage();
    // getBalance(profile.value?.id ?? "");
    super.onInit();
  }
}
