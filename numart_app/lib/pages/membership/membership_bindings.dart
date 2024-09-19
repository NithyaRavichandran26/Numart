import 'package:get/get.dart';

import 'membership_controller.dart';


class MembershipBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MembershipController());
  }
}