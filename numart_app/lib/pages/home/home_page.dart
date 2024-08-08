import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
        appBar: CustomAppBar(
          title: 'NuMart',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 5.0),
              child: SizedBox(
                height: 60.0,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'Search here...',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                    prefixIcon: const Icon(
                        Icons.search, color: Colors.black, size: 30.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 10,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentSlide = index;
                          });
                        },
                      ),
                      items: [
                        'assets/images/bannerOne.jpg',
                        'assets/images/bannerTwo.jpg',
                        'assets/images/bannerThree.jpg',
                      ].map((i) {
                        return Stack(
                          children: [
                            Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(i),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        color: Colors.black.withOpacity(
                                            0.3), // Semi-transparent overlay
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top: 50.0,
                              left: 20.0,
                              right: 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "THE NEW SHAPE OF RUNNING",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    "We molded our softest midsole into a zig-zag shape for one springy ride",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button click logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors
                                          .white, // Button text color
                                    ),
                                    child: const Text('Shop Now'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentSlide == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "FEATURING THE BEST",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    "Top new drops, sales, collabs and collections available now and coming soon.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {
                      // Add your "View All" click logic here
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              height: 400, // Adjust as needed
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard(
                    imageUrl: 'assets/images/featuringthebest1.png',
                    name: 'Smartphones x Numart',
                    description: 'The epic collab returns with a new \niteration of the LX2200',
                    link: 'Shop Now',
                  ),
                  _buildImageCard(
                    imageUrl: 'assets/images/featuringthebest2.jpg',
                    name: 'Numart Kids Explorers',
                    description: 'Specially Made for Kids2',
                    link: 'Know More',
                  ),
                  _buildImageCard(
                    imageUrl: 'assets/images/featuringthebest3.jpg',
                    name: 'Maison Margiela x Numart',
                    description: 'Numart icons reworked, deconstructed, \nand essentialized',
                    link: 'Learn More',
                  ),
                  _buildImageCard(
                    imageUrl: 'assets/images/featuringthebest4.jpg',
                    name: 'Numart x Cardi B',
                    description: 'The kids Club C Cardi V2 are here and \nbringing the energy',
                    link: 'Shop the Collection',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NEW ARRIVALS",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 300, // Adjust as needed
              child: ListView(
                // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival.png',
                    name: 'Classics Long Sleeve Polo Top',
                    price: '\$40',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival1.png',
                    name: 'Basketball Back Vector Fleece Hoodie',
                    price: '\$70',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival2.png',
                    name: 'Workout Plus Shoes',
                    price: '\$85',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival3.png',
                    name: 'Classics Vector Flat Peak Hat',
                    price: '\$25',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival4.png',
                    name: 'Classics Vector Shorts',
                    price: '\$45',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival5.png',
                    name: 'basketball-back-vector-fleece-hoodie',
                    price: '\$70',
                  ),
                  _buildImageCardSimple(
                    imageUrl: 'assets/images/NewArrival6.png',
                    name: 'Smiley Hoodie',
                    price: '\$80',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/nuLogo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login, size: 30.0),
              title: const Text('Login'),
              onTap: () {
                _drawerKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, size: 30.0),
              title: const Text('Help'),
              onTap: () {
                _drawerKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail, size: 30.0),
              title: const Text('Newsletter Signup'),
              onTap: () {
                _drawerKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_membership, size: 30.0),
              title: const Text('Numart Membership'),
              onTap: () {
                _drawerKey.currentState?.closeDrawer();
              },
            ),
          ],
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

  Widget _buildImageCard(
      {required String imageUrl, required String name, required String description, required String link}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            link,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCardSimple({
    required String imageUrl,
    required String name,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10.0), // Optional, for rounded corners
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Inner radius
                  child: Image.asset(
                    imageUrl,
                    width: 200,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    child: Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: 200.0,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
