import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:numart_app/pages/productListing/product_listing_controller.dart';
import '../CustomAppBar.dart';
import '../productDetails/product_details_page.dart';
import 'ProductGridItem.dart';

class ProductListingScreen extends StatefulWidget {
  final String category;

  const ProductListingScreen({Key? key, required this.category}) : super(key: key);

  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late ProductListingController productController;

  @override
  void initState() {
    super.initState();
    productController = ProductListingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30.0),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: productController.fetchProducts(
          GraphQLProvider.of(context).value,
          {
            "category": widget.category,
            "productType": null,
            "offset": 0,
            "limit": 49,
            "fetchType": "Algolia",
            "keyword": null,
            "facets": [],
            "sortBy": null,
            "sortOrder": null,
            "locationCode": "null",
            "bruid": "",
            "deviceType": "mobile",
            "offerDate": null,
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available.'));
          }

          final products = snapshot.data!;

          // Display products in GridView
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Horizontal spacing between items
              mainAxisSpacing: 10.0, // Vertical spacing between items
              childAspectRatio: 0.8, // Adjust the aspect ratio to fit the item layout
            ),
            padding: const EdgeInsets.all(10.0), // Padding around the grid
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productId = product['productId'];
              print('<----productId : ${productId}');
              final int productIdInt = int.tryParse(productId) ?? 0;

              // Construct the image URL using productId
              final imageUrl = 'https://static-numart.s3.amazonaws.com/images/$productIdInt.png';
              print('<----imageUrl : ${imageUrl}');

              return ProductGridItem(
                name: product['newProductName'] ?? 'No Name',
                price: product['salePrice'] != null ? '\$${product['salePrice']}' : 'No Price',
                productId: productId,
                imageUrl: imageUrl, // Updated imageUrl
                onTap: () {
                  // Navigate to ProductDetailsScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(productId: productId),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}