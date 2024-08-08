import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_board_controller.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _pageController = PageController();
  final OnBoardController controller = Get.put(OnBoardController()); // GetX for controller

  void goToNextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    print('<-----controller.currentPage : ${controller.currentPage}');
    return Scaffold(
      backgroundColor: const Color(0xFF030C1D), // Set the background color here
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                controller.updateCurrentPage(index);
              },
              children: [
                _buildPage(
                  image: 'assets/images/on_board.png',
                  title: 'Cool Product',
                  description: 'We create products in collaboration with great designers who are there to get the coolest products for you.',
                ),
                _buildPage(
                  image: 'assets/images/on_board.png',
                  title: 'Latest Style',
                  description: 'The latest styles according to the latest trends to ensure you get the best and coolest products.',
                ),
                _buildPage(
                  image: 'assets/images/on_board.png',
                  title: 'All For You',
                  description: 'We always try to provide the cool products and latest styles by maintaining the best quality for you.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 10,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white30,
                  ),
                ),
                const SizedBox(height: 30),
                // GetBuilder<OnBoardController>( // GetBuilder for reactive updates
                //   builder: (_) => Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       if (controller.currentPage < controller.pageCount - 1) // Show Skip and Next for first 2 slides
                //         TextButton(
                //           onPressed: () {
                //             _pageController.jumpToPage(2);
                //           },
                //           style: TextButton.styleFrom(
                //             foregroundColor: Colors.white,
                //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //           ),
                //           child: const Text('Skip', style: TextStyle(fontSize: 18.0)),
                //         ),
                //       if (controller.currentPage < controller.pageCount - 1) // Show Skip and Next for first 2 slides
                //         Row(
                //           children: [
                //             TextButton(
                //               onPressed: goToNextPage,
                //               child: const Row(
                //                 mainAxisSize: MainAxisSize.min, // To prevent unnecessary expansion
                //                 children: [
                //                   Text('Next', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                //                   Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 20.0),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       if (controller.currentPage == controller.pageCount - 1)
                //         Spacer(), // Add Spacer before the button
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.center, // Center the button vertically
                //         children: [
                //           ElevatedButton(
                //             onPressed: () {
                //               controller.goToHome();
                //             },
                //             style: ElevatedButton.styleFrom(
                //               foregroundColor: Colors.black,
                //               backgroundColor: Colors.white,
                //               padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30.0),
                //               ),
                //             ),
                //             child: const Text('Get Started', style: TextStyle(fontSize: 18.0)),
                //           ),
                //         ],
                //       ),
                //       Spacer(), // Add Spacer after the button
                //     ],
                //   ),
                // ),
                GetBuilder<OnBoardController>(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.currentPage < controller.pageCount - 1) // Show Skip and Next for first 2 slides
                        TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(2);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          child: const Text('Skip', style: TextStyle(fontSize: 18.0)),
                        ),
                      if (controller.currentPage < controller.pageCount - 1) // Show Skip and Next for first 2 slides
                        Row(
                          children: [
                            TextButton(
                              onPressed: goToNextPage,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min, // To prevent unnecessary expansion
                                children: [
                                  Text('Next', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                                  Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 20.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (controller.currentPage == controller.pageCount - 1) // Show Get Started for last slide
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the button vertically
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.goToHome();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: const Text('Get Started', style: TextStyle(fontSize: 18.0)),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(30.0), // Add padding to avoid content being too close to the edges
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity, // Make sure text has enough space
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
              maxLines: 3, // Limit to 3 lines
              overflow: TextOverflow.ellipsis, // Add ellipsis if overflow occurs
            ),
          ),
        ],
      ),
    );
  }
}
