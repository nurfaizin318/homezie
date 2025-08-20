import 'dart:convert';

import 'package:get/get.dart';
import 'package:homzie/Module/Detail/model.dart';
import 'package:homzie/Module/Login/model.dart';
import 'package:homzie/Repository/simulationRepository.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';

class SimulationController extends GetxController {
  var points = <String, double>{}.obs;
  var houseIds = List<DetailEntity>() = [];
  LoginModel? profile;

  var isLoading = false.obs;

  var simulationRepository = SimmulationRepository.instance;
  // Function untuk update pilihan
  void updateSelection(String comparison, double value) {
    points[comparison] = value;
  }

  void submit() async {
    var houses = houseIds.map((e) => e.id.toString()).toList();

    Map<String, dynamic> request = {
      "user_id": profile?.id,
      "house_ids": houses,
      "user_preferences": points,
    };

    print(request);
    isLoading.value = true;
    final result = await simulationRepository.simulate(request);
    print(result);

    if (result.success) {
      print(result.data['message']);
      List<dynamic> rawList = result.data['data'];
      for (var house in rawList) {
        print('${house['name']} - Rank: ${house['rank']} - Score: ${house['score']}');
      }
    } else {
      print("Error fetching house list: ${result.message}");
    }
    isLoading.value = false;
  }

  void getDataFromStorage() {
    var jsonString = Storage.get(StorageKey.Profile.value);
    
    if (jsonString == null || jsonString.isEmpty) {
      return;
    }
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    LoginModel model = LoginModel.fromJson(jsonMap);

    profile = model;

    print(jsonString);
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['houseIds'] != null) {
      houseIds = List<DetailEntity>.from(Get.arguments['houseIds']);
    }
    getDataFromStorage();
    super.onInit();
  }
}
