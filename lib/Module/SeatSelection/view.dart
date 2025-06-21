import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/SeatSelection/viewModel.dart';


class SeatSelection extends StatelessWidget {
  const SeatSelection({super.key});

  @override
  Widget build(BuildContext context) {

     final controller = Get.find<SeatController>();

    return Scaffold(
      appBar: AppBar(title: Text("Pilih Kursi")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => GridView.builder(
            itemCount: controller.seats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final seat = controller.seats[index];
              return GestureDetector(
                onTap: () => controller.toggleSeat(seat),
                child: Container(
                  decoration: BoxDecoration(
                    color: seat.isBooked
                        ? Colors.grey
                        : seat.isSelected
                            ? Colors.green
                            : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      seat.id,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
