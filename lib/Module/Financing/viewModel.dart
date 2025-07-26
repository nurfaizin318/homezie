import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancingController extends GetxController {
  var occupationController = TextEditingController();
  var downPaymentController = TextEditingController();
  var financingAmountController = TextEditingController();

  var selectedTenor = '5 Years'.obs;
  final tenors = ['1 Year', '3 Years', '5 Years', '10 Years'];

  var result = 0.0.obs;

  void calculate() {
    final dp = int.tryParse(
        downPaymentController.text.replaceAll(RegExp(r'[^0-9]'), '')) ??
        0;
    final amount = int.tryParse(
        financingAmountController.text.replaceAll(RegExp(r'[^0-9]'), '')) ??
        0;

    final tenorInYears =
        int.tryParse(selectedTenor.value.replaceAll(RegExp(r'[^0-9]'), '')) ??
            1;
    final tenorInMonths = tenorInYears * 12;

    if (tenorInMonths == 0) {
      result.value = 0;
      return;
    }

    final calculatedInstallment = (amount - dp) / tenorInMonths;
    result.value = calculatedInstallment;

    print('Occupation: ${occupationController.text}');
    print('Down Payment: $dp');
    print('Financing Amount: $amount');
    print('Tenor: ${selectedTenor.value} ($tenorInMonths months)');
    print('Monthly Installment: Rp ${NumberFormat('#,###').format(result.value)}');
  }
}
