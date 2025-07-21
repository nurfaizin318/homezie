import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homzie/Module/Financing/viewModel.dart';


class FinancingCalculator extends StatelessWidget {
  const FinancingCalculator({super.key});

  @override
  Widget build(BuildContext context) {

     final controller = Get.find<FinancingController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Financing Calculator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Occupation'),
          SizedBox(height: 8),
          TextField(
            controller: controller.occupationController,
            decoration: InputDecoration(
              hintText: 'Occupation',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Down Payment'),
          SizedBox(height: 8),
          TextField(
            controller: controller.downPaymentController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Down Payment',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Financing Amount'),
          SizedBox(height: 8),
          TextField(
            controller: controller.financingAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Rp.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Tenor'),
          SizedBox(height: 8),
          Obx(() => DropdownButtonFormField<String>(
                value: controller.selectedTenor.value,
                items: controller.tenors
                    .map((tenor) => DropdownMenuItem(
                          value: tenor,
                          child: Text(tenor),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) controller.selectedTenor.value = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.calculate();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Calculate',
                style: GoogleFonts.poppins(fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
