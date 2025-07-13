
import 'package:get/get.dart';
import 'package:homzie/Binding/binding.dart';
import 'package:homzie/Module/Chat/View.dart';
import 'package:homzie/Module/Detail/view.dart';
import 'package:homzie/Module/Layout/View.dart';
import 'package:homzie/Module/Login/view.dart';
import 'package:homzie/Module/OnBoarding/view.dart';
import 'package:homzie/Module/Profile/View.dart';
import 'package:homzie/Module/PropertyList/view.dart';
import 'package:homzie/Module/Register/view.dart';
import 'package:homzie/Module/Simulation/view.dart';
import 'package:homzie/Module/SplashScreen/view.dart';

class Routes {
  static final pages = [
    GetPage(
        name: "/", page: () => SplashScreen(), binding: SplashScreenBinding()),
    GetPage(name: "/login", page: () => Login(), binding: LoginBinding()),
    GetPage(
        name: "/register",
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
      name: "/layout",
      page: () => const Layout(),
      binding: LayoutBinding(),
    ),
    GetPage(
        name: "/profile", page: () => Profile(), binding: ProfileBinding()),
    GetPage(
        name: "/chat", page: () => const ChatPage(), binding: ChatBinding()),
    GetPage(
        name: "/onboarding",
        page: () => const OnBoarding(),
        binding: OnBoardingBinding()),
    GetPage(
        name: "/detail",
        page: () =>  Detail(),
        binding: DetailBinding()),
   GetPage(
        name: "/property-list",
        page: () =>  PropertyList(),
        binding: PropertyListBinding()),
   GetPage(
        name: "/simulation",
        page: () =>  Simulation(),
        binding: SimulationBinding()),
  ];
}
