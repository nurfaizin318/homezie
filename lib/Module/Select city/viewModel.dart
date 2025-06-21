import 'package:get/get.dart';

class SelectCityController extends GetxController {
  var searchText = ''.obs;
  var allCities = <String>[
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
    'Solo',
    'Semarang',
    'Medan',
    'Palembang',
    'Makassar',
    'Denpasar',
  ].obs;

  RxList<String> filteredCities = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredCities.assignAll(allCities);
    ever(searchText, (_) => _filterCities());
  }

  void _filterCities() {
    if (searchText.isEmpty) {
      filteredCities.assignAll(allCities);
    } else {
      filteredCities.assignAll(allCities.where((city) =>
          city.toLowerCase().contains(searchText.value.toLowerCase())));
    }
  }

  void selectCity(String city) {
    Get.back(result: city); // Kembalikan hasil ke halaman sebelumnya
  }
}
