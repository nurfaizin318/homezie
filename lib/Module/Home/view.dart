
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
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Tiketku"),
          backgroundColor: AppColors.error.withAlpha(20),
          actions: [
            Container(
              decoration: RoundedFixBox.getDecoration(
                radius: 30,
                color: AppColors.lightGrey.withAlpha(60),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 20,
                ),
                onPressed: () {
                  // Implement notification action
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: RoundedFixBox.getDecoration(
                radius: 30,
                color: AppColors.lightGrey.withAlpha(60),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.chat_bubble,
                  size: 17,
                ),
                onPressed: () {
                  // controller.navigateToChat();
                },
              ),
            ),
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              color: AppColors.lightGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountCard(height, width, controller),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: RoundedFixBox.getDecoration(
                        radius: 20, color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cari Tiket Bus",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),

                        // Keberangkatan
                        _BusTicketField(
                          icon: Icons.location_on_outlined,
                          label: "Terminal Keberangkatan",
                          value: "Solo (Tirtonadi)",
                          onTap: () {
                            controller.navigateToSelectCity();
                          },
                        ),
                        const SizedBox(height: 12),

                        // Tujuan
                        _BusTicketField(
                          icon: Icons.flag_outlined,
                          label: "Terminal Tujuan",
                          value: "Jakarta (Pulogebang)",
                          onTap: () {
                            controller.navigateToSelectCity();
                          },
                        ),
                        const SizedBox(height: 12),

                        // Kelas Bus
                        _BusTicketField(
                          icon: Icons.event_seat_outlined,
                          label: "Kelas Bus",
                          value: "Executive",
                          onTap: () {
                            print("test");
                          },
                        ),
                        const SizedBox(height: 12),

                        // Tanggal
                        _BusTicketField(
                          icon: Icons.date_range_outlined,
                          label: "Tanggal Keberangkatan",
                          value: "20 Mei 2025",
                          onTap: () {
                            print("test");
                          },
                        ),

                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              "Cari Tiket",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Recent Transactions
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Recent Transactions",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("See All", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    // leading: Image.asset('assets/bca_logo.png', width: 40), // Replace with real image
                    title: const Text("OLIVIA GRACE BENNETT"),
                    subtitle: const Text("17 Dec 2024 - 13:21"),
                    trailing: const Text(
                      "-\$20.75",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container WalletMenu(double width) {
    return Container(
      width: double.infinity,
      decoration: RoundedFixBox.getDecoration(radius: 20, color: Colors.white),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ActionButton(
            icon: Icons.qr_code_scanner,
            label: "Scan",
            color: AppColors.primary,
          ),
          _ActionButton(
            icon: Icons.account_balance_wallet_outlined,
            label: "Top Up",
            color: AppColors.secondary,
          ),
          _ActionButton(
            icon: Icons.send_outlined,
            label: "Transfer",
            color: AppColors.accent,
          ),
          _ActionButton(
            icon: Icons.money_outlined,
            label: "widtrawal",
            color: AppColors.error,
          ),
        ],
      ),
    );
  }

  Stack AccountCard(double height, double width, HomeController controller) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.primary,
                image: DecorationImage(
                    image: AssetImage("assets/images/Star.png"),
                    fit: BoxFit.cover),
              ),
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.profile.value?.name.toUpperCase() ?? "",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 24)),
                  const SizedBox(height: 6),
                  Skeletonizer(
                    enabled: controller.isLoadingBalance.value,
                    enableSwitchAnimation: true,
                    child: Text(controller.balanceModel.value?.id ?? "",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ),
                  const SizedBox(height: 6),
                  Skeletonizer(
                    enabled: controller.isLoadingBalance.value,
                    enableSwitchAnimation: true,
                    child: Text(
                      CurrencyConverter.formatRupiah(
                          controller.balanceModel.value?.balance ?? 0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 60,
              color: AppColors.lightGrey,
            )
          ],
        ),
        Positioned(
            bottom: 10,
            child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: WalletMenu(width)))
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ActionButton(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: RoundedFixBox.getDecoration(
            radius: 12,
            color: color.withAlpha(40),
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}

class _BusTicketField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _BusTicketField({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
