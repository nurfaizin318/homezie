import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FinancingController extends GetxController {
  var occupationController = TextEditingController();
  var downPaymentController = TextEditingController();
  var financingAmountController = TextEditingController();

  var selectedTenor = '5 Years'.obs;

  final tenors = ['1 Year', '3 Years', '5 Years', '10 Years'];

  void calculate() {
    print('Occupation: ${occupationController.text}');
    print('Down Payment: ${downPaymentController.text}');
    print('Financing Amount: ${financingAmountController.text}');
    print('Tenor: ${selectedTenor.value}');
    // TODO: implement calculation logic or API call
  }
}
