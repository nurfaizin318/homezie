
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Home/view.dart';

import '../Chat/View.dart';
import '../Profile/View.dart';

class LayoutController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> children = [
    Home(),
    ChatPage(),
    Profile(),
    Profile(),
  ];

  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  void goToChat() {
    Get.toNamed("/chat");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
