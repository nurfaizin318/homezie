import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Simulation/model.dart';
import 'package:homzie/Module/Simulation/viewModel.dart';



class Simulation extends StatelessWidget {
  const Simulation({super.key});

  final options = const [
    OptionItem('Sangat Kurang Penting', 1),
    OptionItem('Cukup Kurang Penting', 2),
    OptionItem('Sama Penting', 3),
    OptionItem('Cukup Lebih Penting', 4),
    OptionItem('Sangat Lebih Penting', 5),
  ];

  final comparisons = const [
   ComparisonItems('Harga Rumah', 'price'),
    ComparisonItems('Luas Tanah', 'land_area'),
    ComparisonItems('Luas Bangunan', 'building_area'),
    ComparisonItems('Jumlah Kamar Tidur', 'bedrooms'),
    ComparisonItems('Lokasi', 'distance'),
  ];

  @override
  Widget build(BuildContext context) {
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
  final List<OptionItem> options;
  final List<ComparisonItems> comparisons;

  const _SimulationForm({required this.options, required this.comparisons});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SimulationController>();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (var comparison in comparisons) ...[
          Text(comparison.label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          Obx(
            () => Column(
              children: options.map((option) {
                return RadioListTile<double>(
                  title: Text(option.label),
                  value: option.point,
                  groupValue: controller.points[comparison.value],
                  onChanged: (value) {
                    controller.updateSelection(comparison.value, value??0);
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
              onPressed: controller.points.length == 5
                  ? () {
                      controller.submit();
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
