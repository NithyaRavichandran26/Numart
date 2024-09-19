import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';
import '../home/home_controller.dart';
import '../productListing/product_listing_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30.0),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildCategoryImage('assets/images/men.png', 'MEN', '200000000'),
              const SizedBox(height: 10.0),
              _buildCategoryImage('assets/images/women.png', 'WOMEN', '100000000'),
              const SizedBox(height: 10.0),
              _buildCategoryImage('assets/images/featuringthebest2.jpg', 'UNISEX', '400000000'),
              const SizedBox(height: 10.0),
              _buildCategoryImage('assets/images/kids.png', 'KIDS', '300000000'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: Get.find<HomeController>().selectedIndex,
        onTap: (index) {
          Get.find<HomeController>().onItemTapped(index, context);
        },
      ),
    );
  }

  Widget _buildCategoryImage(String imagePath, String label, String category) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductListingScreen and pass the category value
        Get.to(() => ProductListingScreen(category: category));
      },
      child: Container(
        height: 250.0, // Set a fixed height for each image
        width: double.infinity, // Make sure the image covers the full width
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            ),
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white, // White color for the text
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}