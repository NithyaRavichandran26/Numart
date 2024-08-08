import 'package:get/get.dart';
import 'package:numart_app/pages/settings/settings_controller.dart';


class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(), permanent: true);
  }
}