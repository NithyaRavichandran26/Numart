import 'package:get/get.dart';

import 'on_board_controller.dart';

class OnBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardController(), permanent: true);
  }
}
