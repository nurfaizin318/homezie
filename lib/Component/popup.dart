import 'dart:ui';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  final String? leftButtonText;
  final VoidCallback? onLeftButtonPressed;

  final String? rightButtonText;
  final VoidCallback? onRightButtonPressed;

  const CustomPopup({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.leftButtonText,
    this.onLeftButtonPressed,
    this.rightButtonText,
    this.onRightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool showLeft = leftButtonText != null && onLeftButtonPressed != null;
    final bool showRight = rightButtonText != null && onRightButtonPressed != null;

    return Stack(
      children: [
        // Background Blur
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),

        // Popup Dialog
        Center(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath, height: 100, width: 100),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Buttons
                  if (showLeft || showRight)
                    Row(
                      children: [
                        if (showLeft)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onLeftButtonPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                foregroundColor: Colors.black,
                              ),
                              child: Text(leftButtonText!),
                            ),
                          ),
                        if (showLeft && showRight) const SizedBox(width: 12),
                        if (showRight)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onRightButtonPressed,
                              child: Text(rightButtonText!),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
