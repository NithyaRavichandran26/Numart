// onboard_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class OnBoardController extends GetxController {
  final int pageCount = 3;
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void updateCurrentPage(int index) {
    currentPage.value = index;
    update();
  }

  void goToHome() {
    Get.offAllNamed(Routes.home);
  }

  // int get currentPage => pageController.hasClients ? pageController.page?.round() ?? 0 : 0;
}
