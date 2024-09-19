import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui'; // Import this for using ImageFilter

class ProductGridItem extends StatelessWidget {
  final String name;
  final String price;
  final String productId;
  final String? imageUrl;
  final VoidCallback onTap; // Add onTap callback

  const ProductGridItem({
    Key? key,
    required this.name,
    required this.price,
    required this.productId,
    this.imageUrl,
    required this.onTap, // Initialize onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, // Handle taps
        child: Card(
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl!,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.image_not_supported, size: 80),
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    height: 85, // Set a fixed height for uniformity
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2), // Very subtle color tint
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          maxLines: 2, // Restrict to 1 line for consistency
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(), // Adds flexibility to keep name and price aligned
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'dart:ui'; // Import this for using ImageFilter
//
// class ProductGridItem extends StatelessWidget {
//   final String name;
//   final String price;
//   final String productId;
//   final String? imageUrl;
//
//   const ProductGridItem({
//     Key? key,
//     required this.name,
//     required this.price,
//     required this.productId,
//     this.imageUrl,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5.0,
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               spreadRadius: 3,
//               blurRadius: 5,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             CachedNetworkImage(
//               imageUrl: imageUrl!,
//               placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) => Icon(Icons.image_not_supported, size: 80),
//               fit: BoxFit.fill,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0), // Rounded corners
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), // Increased vertical padding
//                     decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(0.2), // Very subtle color tint
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.black,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 8), // Added some space between name and price
//                         Text(
//                           price,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }