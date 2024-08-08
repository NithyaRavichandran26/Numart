import 'package:get/get.dart';
import 'package:numart_app/pages/wishlist/wishlist_controller.dart';


class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WishlistController(), permanent: true);
  }
}