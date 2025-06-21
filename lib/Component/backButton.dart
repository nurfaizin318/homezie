import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      child: IconButton(
        icon: const Icon(
          Icons.read_more,
        ),
        iconSize: 30,
        color: Colors.white,
        splashColor: Colors.grey,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
