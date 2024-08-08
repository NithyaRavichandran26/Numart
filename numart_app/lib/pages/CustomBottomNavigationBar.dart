import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final RxInt selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag, size: 30.0),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, size: 30.0),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 30.0),
          label: 'More',
        ),
      ],
      currentIndex: selectedIndex.value,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final RxInt selectedIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavigationBar({
//     Key? key,
//     required this.selectedIndex,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home, size: 30.0),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_bag, size: 30.0),
//           label: 'Shop',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite, size: 30.0),
//           label: 'Wishlist',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings, size: 30.0),
//           label: 'Settings',
//         ),
//       ],
//       currentIndex: selectedIndex.value,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.black,
//       unselectedItemColor: Colors.grey,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       onTap: onTap,
//     );
//   }
// }
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // class CustomBottomNavigationBar extends StatelessWidget {
// //   final RxInt selectedIndex;
// //   final Function(int) onTap;
// //
// //   const CustomBottomNavigationBar({
// //     Key? key,
// //     required this.selectedIndex,
// //     required this.onTap,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BottomNavigationBar(
// //       items: const [
// //         BottomNavigationBarItem(
// //           icon: Icon(Icons.home, size: 30.0),
// //           label: 'Home',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: Icon(Icons.shopping_bag, size: 30.0),
// //           label: 'Shop',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: Icon(Icons.favorite, size: 30.0),
// //           label: 'Wishlist',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: Icon(Icons.settings, size: 30.0),
// //           label: 'Settings',
// //         ),
// //       ],
// //       currentIndex: selectedIndex.value,
// //       type: BottomNavigationBarType.fixed,
// //       selectedItemColor: Colors.black,
// //       unselectedItemColor: Colors.grey,
// //       showSelectedLabels: true,
// //       showUnselectedLabels: true,
// //       onTap: onTap,
// //     );
// //   }
// // }
// //
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:numart_app/pages/settings/settings_page.dart';
// // // import 'package:numart_app/pages/wishlist/wishlist_page.dart';
// // //
// // // import 'CustomAppBar.dart';
// // // import 'category/category_page.dart';
// // //
// // // class CustomScreen extends StatefulWidget {
// // //   @override
// // //   _MainScreenState createState() => _MainScreenState();
// // // }
// // //
// // // class _MainScreenState extends State<CustomScreen> {
// // //   int _currentIndex = 0;
// // //
// // //   final List<Widget> _screens = [
// // //     CategoryScreen(),
// // //     WishlistScreen(),
// // //     SettingsScreen(),
// // //   ];
// // //
// // //   final List<String> _titles = [
// // //     'Categories',
// // //     'Wishlist',
// // //     'Settings',
// // //   ];
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: CustomAppBar(title: _titles[_currentIndex]),
// // //       body: _screens[_currentIndex],
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         currentIndex: _currentIndex,
// // //         onTap: (index) {
// // //           setState(() {
// // //             _currentIndex = index;
// // //           });
// // //         },
// // //         items: const [
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.category),
// // //             label: 'Categories',
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.favorite),
// // //             label: 'Wishlist',
// // //           ),
// // //           BottomNavigationBarItem(
// // //             icon: Icon(Icons.settings),
// // //             label: 'Settings',
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
