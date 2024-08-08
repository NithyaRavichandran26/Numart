import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:numart_app/pages/home/home_page.dart';

import '../category/category_page.dart';
import '../settings/settings_page.dart';
import '../wishlist/wishlist_page.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index, BuildContext context) {
    selectedIndex.value = index;
    if (index == 0) {
      Get.to(() => HomeScreen())?.then((_) => resetIndex());
    }
    else if (index == 1) {
      Get.to(() => CategoryScreen())?.then((_) => resetIndex());
    } else if (index == 2) {
      Get.to(() => WishlistScreen())?.then((_) => resetIndex());
    } else if (index == 3) {
      Get.to(() => SettingsScreen())?.then((_) => resetIndex());
    }
  }

  void resetIndex() {
    selectedIndex.value = 0; // Reset to the home index
  }
}


// class HomeController extends GetxController {
//   var selectedIndex = 0.obs;
//
//   void onItemTapped(int index, BuildContext context) {
//     selectedIndex.value = index;
//     if (index == 1) {
//       Get.to(() => CategoryScreen());
//     } else if (index == 2) {
//       Get.to(() => WishlistScreen());
//     } else if (index == 3) {
//       Get.to(() => SettingsScreen());
//     }
//   }
//
//   void resetIndex() {
//     selectedIndex.value = 0; // Reset to home index
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:numart_app/pages/settings/settings_page.dart';
// import 'package:numart_app/pages/wishlist/wishlist_page.dart';
//
// import '../category/category_page.dart';
//
// class HomeController extends GetxController {
//   var selectedIndex = 0.obs;
//   var currentSlide = 0.obs;
//
//   void onItemTapped(int index, BuildContext context) {
//     selectedIndex.value = index;
//     if (index == 1) { // Assuming index 1 corresponds to the shopping bag
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const CategoryScreen()),
//       );
//     }
//     if (index == 2) { // Assuming index 1 corresponds to the shopping bag
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => WishlistScreen()),
//       );
//     }
//     if (index == 3) { // Assuming index 1 corresponds to the shopping bag
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SettingsScreen()),
//       );
//     }
//   }
//
//   void onSlideChanged(int index) {
//     currentSlide.value = index;
//   }
// }