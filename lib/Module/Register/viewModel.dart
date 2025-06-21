import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Component/popup.dart';
import 'package:homzie/Repository/authRepository.dart';

class RegisterController extends GetxController {
  RxBool obsecureTextpassword = true.obs;
  RxBool obsecureTextRepeatPassword = true.obs;
  RxBool obsecureTestStatus = true.obs;

  RxBool loading = false.obs;

  var authRepository = Authrepository.instance;

  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  var nameMessage = "".obs;
  var phoneNumberMessage = "".obs;
  var emailMessage = "".obs;

  void goBack() {
    Get.back();
  }

  void handleRegister() async {
    //reset semua error maessage agar validator textfield val

    emailMessage.value = "";
    nameMessage.value = "";
    phoneNumberMessage.value = "";

    Map<String, String> data = {
      "name": name.text,
      "email": email.text,
      "password": password.text,
      "phone_number": phone.text,
      "role": "CUSTOMER"
    };

    loading.value = true;

    try {
      var result = await authRepository.register(data);
      print(result.errors?.fieldErrors);
      var fieldErrors = result.errors?.fieldErrors;
      loading.value = false;

      if (result.success) {
        Get.dialog(
          CustomPopup(
            imagePath: 'assets/images/question.png',
            title: 'Akunmu berhadil dibuat ',
            description: 'login untuk masuk ke akun kamu?',
            leftButtonText: 'Tidak',
            onLeftButtonPressed: () => Get.back(),
            rightButtonText: 'Ya',
            onRightButtonPressed: () {
              // Aksi lanjut
              Get.back();
              Get.back();
            },
          ),
        );
      } else if (result.code == 400) {
        if (fieldErrors != null) {
          if (fieldErrors.containsKey("phone_number")) {
            phoneNumberMessage.value = fieldErrors["phone_number"]!.first;
          } else if (fieldErrors.containsKey("name")) {
            nameMessage.value = fieldErrors["name"]!.first;
          } else if (fieldErrors.containsKey("email")) {
            emailMessage.value = fieldErrors["email"]!.first;
          } else {
            emailMessage.value = "";
            nameMessage.value = "";
            phoneNumberMessage.value = "";
          }
        }
      }
    } catch (error) {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
