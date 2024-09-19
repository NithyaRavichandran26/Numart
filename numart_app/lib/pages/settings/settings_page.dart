import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';
import '../home/home_controller.dart';

class SettingsScreen extends StatelessWidget {
  final Map<String, IconData> settingsItems = {
    'Edit Profile': Icons.account_circle_outlined,
    'Shopping Address': Icons.home_outlined,
    'Order History': Icons.shopping_cart_outlined,
    'Help': Icons.help_outline,
    'Newsletter Signup': Icons.mail_outlined,
    'NuMart Membership': Icons.person_add_alt_outlined,
    'Login': Icons.person_outline,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'More',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: settingsItems.length * 72.0, // Adjust this multiplier as per your item's height
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: settingsItems.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(
                      height: 0.0,
                      thickness: 1.0,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    String key = settingsItems.keys.elementAt(index);
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      leading: Icon(settingsItems[key], color: Colors.black),
                      title: Text(
                        key,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        if (key == 'NuMart Membership') {
                          Get.toNamed(Routes.membership);  // Navigate to Routes.membership
                        }
                        else if (key == 'Login') {
                          Get.toNamed(Routes.login);  // Navigate to Routes.membership
                        }
                        else {
                          // Handle other taps
                        }
                      },
                    );
                  },
                ),
              ),
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
// class SettingsScreen extends StatelessWidget {
//   final Map<String, IconData> settingsItems = {
//     'Edit Profile': Icons.account_circle_outlined,
//     'Shopping Address': Icons.home_outlined,
//     'Order History': Icons.shopping_cart_outlined,
//     'Help': Icons.help_outline,
//     'Newsletter Signup': Icons.mail_outlined,
//     'NuMart Membership': Icons.person_add_alt_outlined,
//     'Login': Icons.person_outline,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'More',
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
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Container(
//               constraints: BoxConstraints(
//                 maxHeight: settingsItems.length * 72.0, // Adjust this multiplier as per your item's height
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 8.0,
//                     spreadRadius: 2.0,
//                     offset: Offset(2.0, 2.0),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15.0),
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   itemCount: settingsItems.length,
//                   separatorBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Divider(
//                       height: 0.0,
//                       thickness: 1.0,
//                     ),
//                   ),
//                   itemBuilder: (context, index) {
//                     String key = settingsItems.keys.elementAt(index);
//                     return ListTile(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//                       leading: Icon(settingsItems[key], color: Colors.black),
//                       title: Text(
//                         key,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {
//                         // Handle item tap
//                       },
//                     );
//                   },
//                 ),
//               ),
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