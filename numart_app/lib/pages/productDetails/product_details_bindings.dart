import 'package:get/get.dart';
import 'package:numart_app/pages/productDetails/product_details_controller.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController(), permanent: true);
  }
}



