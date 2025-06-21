import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homzie/Module/Profile/ViewModel.dart';
import 'package:homzie/Theme/appColors.dart';
import 'package:homzie/Utils/Style/style.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            
               Container(
                padding: const EdgeInsets.only(top: 100),
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  image: DecorationImage(
                      image: AssetImage("assets/images/Star.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Marie T Wiedman",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Marie@gmail.com",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
        
            // Content Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: RoundedFixBox.getDecoration(
                        color: AppColors.lightGrey,
                        radius: 15,
                      ),
                      child: buildItem(Icons.account_balance_wallet, 'Wallet',
                          controller.openWallet)),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: RoundedFixBox.getDecoration(
                        color: AppColors.lightGrey,
                        radius: 15,
                      ),
                      child: Column(
                        children: [
                          buildItem(Icons.edit, 'Edit Profile',
                              controller.editProfile),
                          buildItem(Icons.block, 'View Blocked Users',
                              controller.viewBlockedUsers),
                          buildItem(Icons.task, 'Task Center',
                              controller.openTaskCenter),
                          buildItem(Icons.history, 'Activities',
                              controller.viewActivities),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: RoundedFixBox.getDecoration(
                        color: AppColors.lightGrey,
                        radius: 15,
                      ),
                      child: Column(
                        children: [
                          buildItem(Icons.settings, 'Settings',
                              controller.openSettings),
                          buildItem(Icons.stacked_line_chart, 'Level',
                              controller.openLevel),
                          buildItem(Icons.favorite_border, 'Favorites',
                              controller.openFavorites),
                          buildItem(Icons.download, 'Downloads',
                              controller.openDownloads),
                          const SizedBox(height: 24),
                        ],
                      )),
                  const Divider(
                    height: 24,
                    color: AppColors.lightGrey,
                  ),
                  GestureDetector(
                    onTap: controller.logout,
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
