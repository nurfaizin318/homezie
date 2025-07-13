import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    // Future.delayed(const Duration(seconds: 2), () async {
      moveToHomePage();
    // });

    super.onInit();
  }

  void moveToHomePage() {
    Get.toNamed("/layout");
    print("login");
  }
}
