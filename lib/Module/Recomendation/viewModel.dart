import 'package:get/get.dart';

class RecommendationController extends GetxController {
  var recommendations = [
    {
      'ranking': 1,
      'name': 'Rumah MainRoad',
      'image_url': 'https://example.com/house1.jpg',
    },
    {
      'ranking': 2,
      'name': 'Rumah Mainroad',
      'image_url': 'https://example.com/house2.jpg',
    },
    {
      'ranking': 3,
      'name': 'Rumah Mainroad',
      'image_url': 'https://example.com/house3.jpg',
    },
  ].obs;


 void navigateToCalculator() {
    Get.toNamed('/financing');
 }
}
