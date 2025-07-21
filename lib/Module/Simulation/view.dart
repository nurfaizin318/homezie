import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Simulation/viewModel.dart';

class Simulation extends StatelessWidget {
  const Simulation({super.key});

  final options = const [
    'Sangat Kurang Penting',
    'Cukup Kurang Penting',
    'Sama Penting',
    'Cukup Lebih Penting',
    'Sangat Lebih Penting',
  ];

  final comparisons = const [
    'Harga Rumah banding Luas Tanah',
    'Harga Rumah banding Luas Bangunan',
    'Harga Rumah banding Jumlah Kamar',
    'Harga Rumah banding Lokasi',
    'Luas Tanah banding Luas Bangunan',
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, String> selections = {};

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Simulation',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _SimulationForm(options: options, comparisons: comparisons),
    );
  }
}

class _SimulationForm extends StatelessWidget {
  final List<String> options;
  final List<String> comparisons;

  const _SimulationForm({required this.options, required this.comparisons});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SimulationController>();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (var comparison in comparisons) ...[
          Text(comparison, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          Obx(
            () => Column(
              children:
                  options.map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: controller.selections[comparison],
                      onChanged: (value) {
                        controller.updateSelection(comparison, value!);
                      },
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 16),
        ],
        const SizedBox(height: 24),
        Obx(
          () => SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed:
                  controller.selections.length == 5
                      ? () {
                        controller.submit();
                        // Use a logging framework instead of print in production
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Simulation',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
