import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit()  {
    super.onInit();
  }

  void navigateToOnBoard() {
    Get.offAllNamed(Routes.onboard);
  }

  void navigateToHome() {
      Get.offAllNamed(Routes.home);
  }
}
