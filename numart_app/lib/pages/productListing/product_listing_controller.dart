import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductListingController extends ChangeNotifier {
  final String productSearchQuery = """
  query productSearch(\$category: String, \$productType: String, \$offset: Int, \$limit: Int, \$fetchType: String, \$keyword: String, \$facets: [String], \$sortBy: String, \$sortOrder: String, \$locationCode: String, \$bruid: String, \$deviceType: String, \$offerDate: String) {
    productSearch(
      category: \$category,
      productType: \$productType,
      offset: \$offset,
      limit: \$limit,
      fetchType: \$fetchType,
      keyword: \$keyword,
      facets: \$facets,
      sortBy: \$sortBy,
      sortOrder: \$sortOrder,
      locationCode: \$locationCode,
      bruid: \$bruid,
      deviceType: \$deviceType,
      offerDate: \$offerDate
    ) {
      results {
        newProductName
        productId
        salePrice
        thumbImage
        slug
      }
    }
  }
  """;

  Future<List<dynamic>> fetchProducts(GraphQLClient client, Map<String, dynamic> variables) async {
    final QueryOptions options = QueryOptions(
      document: gql(productSearchQuery),
      variables: variables,
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      return [];
    }

    final productSearch = result.data?['productSearch'];
    if (productSearch == null) {
      return [];
    }

    return productSearch['results'] ?? [];
  }
}
