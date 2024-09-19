import 'package:get/get.dart';
import 'package:numart_app/pages/productListing/product_listing_controller.dart';

class ProductListingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductListingController(), permanent: true);
  }
}



