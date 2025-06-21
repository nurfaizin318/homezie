import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends GetxController {

  RxInt currentIndex = 0.obs;


  void onPageChanged(int index) {
    currentIndex.value = index;
  }
  final List<Color> background = [
    Colors.white,
    Colors.blue,
    Colors.purple,
  ];

}
