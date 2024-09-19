import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';
import '../home/home_controller.dart';

class MembershipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Membership',
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30.0),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Once you add something to your cart, it will appear here. Ready to get started?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set text color to black
              ),
            ),
            SizedBox(height: 20.0), // Increase space between sections
            Text(
              'Starting May 8, 2023, the NUMart UNLOCKED program is phasing out. The UNLOCKED branding will go away, and you will become a NUMart account holder. Don’t worry – you will still retain access to the best perks (and the ones you loved the most).',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Text(
              'What perks will still be included?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '1. Free Shipping & Returns\n'
                  '2. Welcome Voucher\n'
                  '3. Early access to new releases and sales\n'
                  '4. Members’ exclusive products\n'
                  '5. Annual Birthday Gift',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Text(
              'Why did the perks change?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'We listened to your feedback and learned which program benefits were the most important to keep. We also believe this leaner program will enable us to better serve you going forward.',
              style: TextStyle(fontSize: 18, color: Colors.black),
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
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../CustomAppBar.dart';
// import '../CustomBottomNavigationBar.dart';
// import '../home/home_controller.dart';
//
// class MembershipScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Membership',
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart, size: 30.0),
//             onPressed: () {
//               // Handle cart icon tap
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Once you add something to your cart, it will appear here. Ready to get started?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Starting May 8, 2023, the NUMart UNLOCKED program is phasing out. The UNLOCKED branding will go away, and you will become a NUMart account holder. Don’t worry – you will still retain access to the best perks (and the ones you loved the most).',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'What perks will still be included?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               '1. Free Shipping & Returns\n'
//                   '2. Welcome Voucher\n'
//                   '3. Early access to new releases and sales\n'
//                   '4. Members’ exclusive products\n'
//                   '5. Annual Birthday Gift',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Why did the perks change?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'We listened to your feedback and learned which program benefits were the most important to keep. We also believe this leaner program will enable us to better serve you going forward.',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: Get.find<HomeController>().selectedIndex,
//         onTap: (index) {
//           Get.find<HomeController>().onItemTapped(index, context);
//         },
//       ),
//     );
//   }
// }