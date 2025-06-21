import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return  Container(
      color: Colors.black.withAlpha(40),
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(), // loading bawaan Flutter
      ),
    );
  }
}