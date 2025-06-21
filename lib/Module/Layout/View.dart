
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
    icon: Icons.favorite_border,
    title: 'Wishlist',
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
          () =>      BottomBarCreative(
              items: items,
              backgroundColor: AppColors.primary,
              color: Colors.white,
              colorSelected: Colors.blue,
              indexSelected: controller.currentIndex.value,
              highlightStyle:const HighlightStyle(
                isHexagon: true,
              ),
              onTap: (int index) => controller.onTabTapped(index)
            ),
        ),
        body: Obx(() => controller.children[controller.currentIndex.value]));
  }
}
