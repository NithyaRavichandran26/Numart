import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:numart_app/pages/productListing/product_listing_bindings.dart';
import 'package:numart_app/pages/productListing/product_listing_controller.dart';
import '../pages/category/category_bindings.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_bindings.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_bindings.dart';
import '../pages/login/login_page.dart';
import '../pages/membership/membership_bindings.dart';
import '../pages/membership/membership_page.dart';
import '../pages/onboard/on_board_bindings.dart';
import '../pages/onboard/on_board_screen.dart';
import '../pages/productDetails/product_details_bindings.dart';
import '../pages/productDetails/product_details_page.dart';
import '../pages/productListing/product_listing_page.dart';
import '../pages/settings/settings_bindings.dart';
import '../pages/settings/settings_page.dart';
import '../pages/signup/signup_bindings.dart';
import '../pages/signup/signup_page.dart';
import '../pages/splash/splash_bindings.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/wishlist/wishlist_bindings.dart';
import '../pages/wishlist/wishlist_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
  GetPage(
  name: Routes.splash,
  page: () => SplashScreen(),
  binding: SplashBindings()),
    GetPage(
        name: Routes.login,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.signup,
        page: () => SignupScreen(),
        binding: SignupBindings()),
    GetPage(
        name: Routes.onboard,
        page: () => const OnBoardScreen(),
        binding: OnBoardBinding()),
    GetPage(
        name: Routes.home,
        page: () => HomeScreen(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.category,
        page: () => const CategoryScreen(),
        binding: CategoryBindings()),
    GetPage(
        name: Routes.wishlist,
        page: () => WishlistScreen(),
        binding: WishlistBindings()),
    GetPage(
        name: Routes.settings,
        page: () => SettingsScreen(),
        binding: SettingsBindings()),
    GetPage(
        name: Routes.membership,
        page: () => MembershipScreen(),
        binding: MembershipBindings()),
    GetPage(
      name: Routes.productlist,
      page: () => ProductListingScreen(
        category: Get.parameters['category'] ?? 'default', // Default or handle the missing parameter case
      ),
      binding: ProductListingBindings(),
    ),
    GetPage(
      name: Routes.product_details,
      page: () => ProductDetailsScreen(
        productId: Get.parameters['productId'] ?? 'default', // Pass the productId from the route parameters
      ),
      binding: ProductDetailsBindings(),
    )
  ];
}