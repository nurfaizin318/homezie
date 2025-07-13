import 'package:get/get.dart';


class SimulationController extends GetxController {
 var selections = <String, String>{}.obs;

  // Function untuk update pilihan
  void updateSelection(String comparison, String value) {
    selections[comparison] = value;
  }


   void submit() {
    print(selections);
  }
}