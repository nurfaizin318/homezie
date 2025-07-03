
import 'package:get/get.dart';
import 'package:homzie/Module/Chat/ViewModel.dart';
import 'package:homzie/Module/Detail/viewModel.dart';
import 'package:homzie/Module/Home/viewModel.dart';
import 'package:homzie/Module/Layout/viewModel.dart';
import 'package:homzie/Module/Login/viewModel.dart';
import 'package:homzie/Module/OnBoarding/viewModel.dart';
import 'package:homzie/Module/Profile/ViewModel.dart';
import 'package:homzie/Module/Register/viewModel.dart';
import 'package:homzie/Module/SplashScreen/viewModel.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(), fenix: true);
  }
}


class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: false);
  }
}

class LayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: false);
  }
}

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(), fenix: false);
  }
}

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController(), fenix: false);
  }
}


class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(), fenix: false);
  }
}

