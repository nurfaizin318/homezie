
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Register/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = Get.find<RegisterController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 80),
                    height: height * 0.50,
                    width: width,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      image: DecorationImage(
                          image: AssetImage("assets/images/Star.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo_product_2.png",
                          fit: BoxFit.cover,
                          height: 16,
                          width: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Create a new Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 36,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Fill the form to register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.50,
                      width: width,
                      color: AppColors.lightGrey,
                    ),
                  )
                ],
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(
                    top: 250,
                    left: 24,
                    right: 24,
                  ),
                  height: 500,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.name,
                            decoration: InputDecoration(
                              hintText: "Name",
                              isDense: true,
                              counterText: "",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: AppColors.textSecondary,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            textAlign: TextAlign.start,
                            maxLength: 50,
                            validator: (value) => value!.isEmpty
                                ? 'Nama tidak boleh kosong'
                                : null,
                          ),

                          controller.nameMessage.value.isNotEmpty
                              ? Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    controller.nameMessage.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                              )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.email,
                            decoration: InputDecoration(
                              hintText: "Email",
                              isDense: true,
                              counterText: "",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColors.textSecondary,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Email tidak boleh kosong'
                                : null,
                          ),

                          controller.emailMessage.value.isNotEmpty
                              ? Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    controller.emailMessage.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                              )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.password,
                            obscureText: controller.obsecureTestStatus.value,
                            decoration: InputDecoration(
                              hintText: "Password",
                              isDense: true,
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.textSecondary,
                              ),
                              suffixIcon: IconButton(
                                icon: controller.obsecureTestStatus.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  controller.obsecureTestStatus.value =
                                      !controller.obsecureTestStatus.value;
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Password tidak boleh kosong'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.confirmPassword,
                            obscureText: controller.obsecureTestStatus.value,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              isDense: true,
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.textSecondary,
                              ),
                              suffixIcon: IconButton(
                                icon: controller.obsecureTestStatus.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  controller.obsecureTestStatus.value =
                                      !controller.obsecureTestStatus.value;
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            validator: (value) =>
                                value != controller.password.text
                                    ? 'Password tidak cocok'
                                    : null,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "No. HP",
                              isDense: true,
                              counterText: "",
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: AppColors.textSecondary,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field tidak boleh kosong';
                              }
                             
                              return null;
                            },
                          ),
                          controller.phoneNumberMessage.value.isNotEmpty
                              ?  Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    controller.phoneNumberMessage.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                              )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.handleRegister();
                              }
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.primary,
                              ),
                              child: Center(
                                child: controller.loading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text("Sudah punya akun?"),
                          TextButton(
                            onPressed: () {
                              controller.goBack();
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
