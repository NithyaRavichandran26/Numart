import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}