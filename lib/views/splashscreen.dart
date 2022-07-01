import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productsshop/views/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), getToMainMenu);
  }

  getToMainMenu() {
    Get.to(() => const NavigatorUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: SizedBox(
            width: Get.width / 2,
            height: Get.width / 2,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
