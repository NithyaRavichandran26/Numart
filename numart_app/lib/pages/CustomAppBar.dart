import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget? leadingIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
      actions: actions,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: leadingIcon,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//
//   const CustomAppBar({required this.title, required List<IconButton> actions});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       title: Center(
//         child: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 25.0,
//             fontWeight: FontWeight.w900,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back, color: Colors.black),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.shopping_cart, color: Colors.black),
//           onPressed: () {
//             // Handle cart icon tap
//           },
//         ),
//       ],
//       elevation: 0,
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
