import 'package:get/get.dart';
import 'package:homzie/Module/SeatSelection/model.dart';


class SeatController extends GetxController {
 var seats = <SeatModel>[
    SeatModel(id: 'A1',isBooked: true),
    SeatModel(id: 'A2'),
    SeatModel(id: 'A3'),
    SeatModel(id: 'A4'),
    SeatModel(id: 'B1'),
    SeatModel(id: 'B2'),
    SeatModel(id: 'B3'),
    SeatModel(id: 'B4'),
    SeatModel(id: 'C1'),
    SeatModel(id: 'C2'),
    SeatModel(id: 'C3'),
    SeatModel(id: 'C4'),
    SeatModel(id: 'D1'),
    SeatModel(id: 'D2'),
    SeatModel(id: 'D3'),
    SeatModel(id: 'D4'),
    SeatModel(id: 'E1'),
    SeatModel(id: 'E2'),
    SeatModel(id: 'E3'),
    SeatModel(id: 'E4'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _generateSeats();
  }

  void _generateSeats() {
    // Membuat 5 baris x 4 kolom kursi
    for (int i = 0; i < 5; i++) {
      for (int j = 1; j <= 4; j++) {
        seats.add(SeatModel(id: '${String.fromCharCode(65 + i)}$j'));
      }
    }
  }

   void toggleSeat(SeatModel seat) {
    if (!seat.isBooked) {
      seat.isSelected = !seat.isSelected;
      seats.refresh();
    }
  }
}
