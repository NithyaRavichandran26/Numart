import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numart_app/pages/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      controller.navigateToOnBoard();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/nuLogo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
