import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numart_app/pages/home/home_page.dart';
import 'package:numart_app/pages/settings/settings_page.dart';
import 'package:numart_app/pages/wishlist/wishlist_page.dart';

import 'CustomAppBar.dart';
import 'CustomBottomNavigationBar.dart';
import 'category/category_page.dart';

class CustomNavigationScreen extends StatefulWidget {
  @override
  _CustomNavigationScreenState createState() => _CustomNavigationScreenState();
}

class _CustomNavigationScreenState extends State<CustomNavigationScreen> {
  final RxInt _selectedIndex = 0.obs; // RxInt to manage the selected index

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _getAppBarTitle(_selectedIndex.value),
        leadingIcon: _selectedIndex.value == 0
            ? IconButton(
          icon: const Icon(Icons.person, size: 30.0),
          onPressed: () {
            // Handle profile icon tap
          },
        )
            : IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
      ),
      body: Obx(() {
        print('Current Index: ${_selectedIndex.value}'); // Debugging statement
        return _screens[_selectedIndex.value];
      }), // Reactive screen update
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          print('Selected Index: $index'); // Debugging statement
          _selectedIndex.value = index; // Update the selected index
        },
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Categories';
      case 2:
        return 'Wishlist';
      case 3:
        return 'Settings';
      default:
        return '';
    }
  }
}
