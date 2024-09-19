import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../utils/utils.dart';
import '../CustomAppBar.dart';
import '../CustomBottomNavigationBar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  final String TAG = "ProductDetailsScreen";

  ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);

  // Define the GraphQL query string
  String productQuery = '''
  query productGetV2(\$code: String, \$showPreview: Boolean) {
    productGetV2(code: \$code, showPreview: \$showPreview) {
      data {
        ...ProductResultFragment
        __typename
      }
      __typename
    }
  }

  fragment ProductResultFragment on ProductResult {
    id
    productId
    newProductName
    newProductDesc
    rating
    reviewCount
    highlightImages {
    highlightOrder
    hightightImageUrl
    url
    productView
    imageStyle
    sortOrder
    __typename
  }
    variants {
      id
      regularPrice
      salePrice
      sizeFilter
      displaySize
    }
    __typename
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Details',
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30.0),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      body: Query(
        options: QueryOptions(
          document: gql(productQuery),
          variables: {'code': productId, 'showPreview': false},
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            debugLog(tag: TAG, value: 'Loading product details...');
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            debugLog(tag: TAG, value: 'GraphQL Exception: ${result.exception.toString()}');
            return Center(child: Text(result.exception.toString()));
          }

          // Log the result data for debugging
          debugLog(tag: TAG, value: 'GraphQL Data: ${result.data.toString()}');

          // Extract product data from GraphQL response
          final product = result.data?['productGetV2']?['data'];

          if (product == null) {
            debugLog(tag: TAG, value: 'Product not found');
            return const Center(child: Text('Product not found'));
          }

          // Safely extract highlightImages and variants
          final highlightImages = List<dynamic>.from(product['highlightImages'] ?? []);
          final variants = List<dynamic>.from(product['variants'] ?? []);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Product Images Carousel
                if (highlightImages.isNotEmpty)
                  Container(
                    height: 300,
                    child: PageView.builder(
                      itemCount: highlightImages.length,
                      itemBuilder: (context, index) {
                        // Check for valid index before accessing
                        if (index >= 0 && index < highlightImages.length) {
                          final imageUrl = highlightImages[index]['hightightImageUrl'];
                          print('<------details imageUrl : ${imageUrl}');
                          return imageUrl.isNotEmpty
                              ? Image.network(imageUrl, fit: BoxFit.cover)
                              : const Center(child: Text('Image not available'));
                        } else {
                          // Handle invalid index case (optional)
                          return const SizedBox(); // or show an error message
                        }
                      },
                    ),
                  )
                else
                  const Center(child: Text('No images available')),

                const SizedBox(height: 16.0),

                // Product Name
                Text(
                  product['newProductName'] ?? 'No name available',
                  style: Theme.of(context).textTheme.headline6,
                ),

                const SizedBox(height: 8.0),

                // Product Price
                if (variants.isNotEmpty)
                  Text(
                    '₹${variants[0]['salePrice'] ?? variants[0]['regularPrice'] ?? 'N/A'}',
                    style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.green),
                  )
                else
                  const Text('Price not available'),

                const SizedBox(height: 8.0),

                // Product Description
                Text(
                  product['newProductDesc'] ?? 'No description available',
                  style: Theme.of(context).textTheme.bodyText2,
                ),

                const SizedBox(height: 16.0),

                // Product Rating
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    Text('${product['rating'] ?? 0} (${product['reviewCount'] ?? 0} reviews)'),
                  ],
                ),

                const SizedBox(height: 16.0),

                // Size Variants
                if (variants.isNotEmpty) ...[
                  Text('Select Size:', style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: List<Widget>.generate(
                      variants.length,
                          (index) => ChoiceChip(
                        label: Text(variants[index]['displaySize'] ?? ''),
                        selected: false, // Implement selection logic
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 16.0),

                // Add to Cart Button
                ElevatedButton(
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                  child: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
