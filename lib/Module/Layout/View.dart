
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:homzie/Module/Layout/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';




const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Shop',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LayoutController>();

    return Scaffold(
        bottomNavigationBar: Obx(
          () =>      BottomBarInspiredOutside(
              items: items,
              backgroundColor: AppColors.primary,
              color: Colors.white,
              colorSelected: Colors.white,
              
              indexSelected: controller.currentIndex.value,
              animated: true,
             itemStyle: ItemStyle.circle,
              onTap: (int index) => controller.onTabTapped(index)
            ),
            
        ),
        body: Obx(() => controller.children[controller.currentIndex.value]));
  }
}
