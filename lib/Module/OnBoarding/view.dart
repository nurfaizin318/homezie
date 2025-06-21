import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/OnBoarding/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';
import 'package:introduction_screen/introduction_screen.dart';



class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    final introKey = GlobalKey<IntroductionScreenState>();

    final controller = Get.find<OnBoardingController>();

    void onIntroEnd(context) {
      Get.toNamed("/login");
    }


    Widget buildImage(String assetName, [double width = 350]) {
      return Image.asset('assets/images/$assetName', width: width);
    }

    const bodyStyle = TextStyle(fontSize: 19.0);

    var pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Obx(()=> IntroductionScreen(
      key: introKey,
      onChange: (value) => controller.onPageChanged(value),
      globalBackgroundColor: controller.background[controller.currentIndex.value],
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
   
      pages: [
        PageViewModel(
          title: "Selamat Datang",
          body: "tiketku siap mengantar anda sampai tujuan",
          image: buildImage('ride.jpg'),
          decoration: pageDecoration,
        ),
        
        PageViewModel(
          title: "Promo Melimpah",
          body: "NIkmati promo melimpah dari tiketku",
          image: buildImage('ride.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Aman dan terpercaya",
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aman dan Nyaman", style: bodyStyle),
              // Text("keamanan dan kenyamanan anda", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: buildImage('ride.jpg'),
          reverse: true,
        ),
      ],
      onDone: () => onIntroEnd(context),
      onSkip: () => onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.surface), ),
      next: const Icon(Icons.arrow_forward, color: AppColors.surface),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.surface),),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.surface,
        activeColor: AppColors.textSecondary,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ));
  }
}
