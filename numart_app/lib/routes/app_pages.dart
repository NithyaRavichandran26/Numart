import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../pages/category/category_bindings.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_bindings.dart';
import '../pages/home/home_page.dart';
import '../pages/onboard/on_board_bindings.dart';
import '../pages/onboard/on_board_screen.dart';
import '../pages/settings/settings_bindings.dart';
import '../pages/settings/settings_page.dart';
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
  ];
}