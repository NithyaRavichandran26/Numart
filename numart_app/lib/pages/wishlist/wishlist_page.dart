import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';
import '../home/home_controller.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist',
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30.0),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Wishlist Screen Content'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: Get.find<HomeController>().selectedIndex,
        onTap: (index) {
          Get.find<HomeController>().onItemTapped(index, context);
        },
      ),
    );
  }
}
