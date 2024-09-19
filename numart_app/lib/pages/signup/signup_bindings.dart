import 'package:get/get.dart';
import 'package:numart_app/pages/settings/settings_controller.dart';
import 'package:numart_app/pages/signup/signup_controller.dart';


class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController(), permanent: true);
  }
}