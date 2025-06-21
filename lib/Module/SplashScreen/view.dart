// import 'package:tiketku/Module/SplashScreen/viewModel.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final controller = Get.find<SplashScreenController>();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        
        color: Colors.lightBlue,
        width: width,
        height: height,
        child: Center(
          child: Text("Homezie",style: TextStyle(fontSize: 40,color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
