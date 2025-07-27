import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Login/model.dart';
import 'package:homzie/Repository/authRepository.dart';
import 'package:homzie/Utils/Extention/Storage/hive.dart';


class LoginController extends GetxController {
  RxBool obsecureTestStatus = true.obs;
  RxBool authorizationFailed = false.obs;
  RxString errorMessage = "".obs;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  RxBool isLoginLoading = false.obs;

  var authRepository = Authrepository.instance;

  void moveToRegister() {
    Get.toNamed('/register');
  }

  void moveToHomePage() {
    Get.toNamed('/layout');
  }

  void handleLogin() async {
    errorMessage.value = "";

    if (email.text == "" || password.text == "") {
      errorMessage.value = "wrong email or password";
    } else {
      isLoginLoading.value = true;

      try {
        var result = await authRepository.login(email.text, password.text);

        if (result.success) {
          LoginModel loginModel = LoginModel.fromJson(result.data);
          Storage.saveJson(StorageKey.Profile.value, loginModel);
          Storage.save(StorageKey.Token.value, loginModel.accessToken);
          Get.offAllNamed("/layout");
        } else if (result.code == 401){
          errorMessage.value =  "wrong email or password";
        }

        isLoginLoading.value = false;

      } catch (error) {

        isLoginLoading.value = false;
        if (error == "401") {
          errorMessage.value = "wrong email or password";
        }
      }
    }
  }
}
