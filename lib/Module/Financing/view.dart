import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hasil Perhitungan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              children: [
                                Text(
                                  'Nominal Angsuran',
                                  style: TextStyle(fontSize: 14,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Obx(() => Text(
                                  'Total: Rp ${NumberFormat('#,###', 'id_ID')
                                      .format(controller.result.value.toInt())} '
                                      '\n /bulan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.info_outline),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Angsuran hanya sebatas simulasi, angsuran bersifat tidak mengikat dan dapat berubah sewaktu-waktu sesuai kebijakan bank.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: implement verification flow
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Retry',
                            style: GoogleFonts.poppins(
                             color: Colors.white
                            )),
                          ),
                          SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Close'),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Calculate',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
