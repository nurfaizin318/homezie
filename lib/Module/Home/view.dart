import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homzie/Module/Home/model.dart';
import 'package:homzie/Module/Home/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';
import 'package:homzie/Utils/Style/style.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text("Tiketku"),
        backgroundColor: AppColors.background.withAlpha(20),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                children: [
                  Text("Choose Your", style: GoogleFonts.poppins(fontSize: 21)),
                  Text(
                    " Dream House",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            TextFieldSearch(),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Near",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text("More"),
                ],
              ),
            ),
            SizedBox(height: 15),

            Obx(()=> Skeletonizer(
              enabled: controller.isLoadingHouse.value,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.houseList.value.length,
                itemBuilder: (context, index) {
                  final house = controller.houseList.value[index];
                  return Flexible(child: HouseList(house, controller));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // max 2 item kesamping
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 0,
                  childAspectRatio: 3.5/ 4, // lebar / tinggi ratio
                ),
              ),
            )),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Features",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    decoration: RoundedBoxWithShadow.getDecoration(
                      radius: 10,
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/checkmark.png",
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Property List Criteria",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Features",
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    decoration: RoundedBoxWithShadow.getDecoration(
                      radius: 10,
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/calculator.png",
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Property List Criteria",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Features",
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  InkWell HouseList(HouseEntity data, HomeController c) {
    return InkWell(
      onTap: (){c.navigateToDetail(data.id);},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: 191,
        height: 195,
        decoration: RoundedBoxWithShadow.getDecoration(
          radius: 10,
          elevation: 1,
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              height: 95,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigate to detail page
                  Get.toNamed("/detail");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Rp. ${NumberFormat.decimalPattern('id').format(int.parse(data.price))}",
                      style: TextStyle(fontSize: 12, color: AppColors.info),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      child: Row(
                        children:  [
                          Expanded(
                            child: Text(
                              data.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Icon(Icons.map, size: 16, color: Colors.blue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container TextFieldSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
