import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Home/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';
import 'package:homzie/Utils/Extention/Currency/currency.dart';
import 'package:homzie/Utils/Style/style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
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
                  Text("Choose Your", style: TextStyle(fontSize: 21)),
                  Text(
                    " Dream House",
                    style: TextStyle(
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
            SizedBox(height: 50),
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
            HouseList(),
            SizedBox(height: 15),
            HouseList(),
            SizedBox(height: 15),
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

  Container HouseList() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.only(left: 20, top: 15, bottom: 10),
              width: 191,
              height: 195,
              decoration: RoundedBoxWithShadow.getDecoration(
                radius: 10,
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/house-icon.png",
                    fit: BoxFit.cover,
                    height: 90,
                    width: 191,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Navigate to detail page
                        Get.toNamed("/detail");
                        print("tets");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Card Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'This is a description of the card.',
                            style: TextStyle(fontSize: 12, color: AppColors.info),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Jakarta, Indonesia',
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
            );
          }),
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
          hintText: 'Email address',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
