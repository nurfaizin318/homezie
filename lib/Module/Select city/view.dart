
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Select%20city/viewModel.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectCityController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white,size: 40,),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Pilih Kota',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Cari kota",
                  isDense: true,
                  counterText: "",
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  // contentPadding: const EdgeInsets.all(5.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none)),
              onChanged: (value) => controller.searchText.value = value,
            ),
          ),
          Expanded(
            child: Obx(() => ListView.separated(
                  itemCount: controller.filteredCities.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final city = controller.filteredCities[index];
                    return ListTile(
                      title: Text(city),
                      onTap: () => controller.selectCity(city),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
