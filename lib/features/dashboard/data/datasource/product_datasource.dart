import 'dart:convert';

import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:ecommerce/features/dashboard/data/models/product_models.dart';

class ProductDataSource {
  Future<List<ProductModel>> fetchProducts() async {
    var response =
        await NetworkHandler.getRequest(AppLink.products, queryParams: {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonList = json.decode(response.body);
      jsonList.forEach((product) {
        print('product response $product');
      });
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to fetch products: ${response.statusCode}');
    }
  }
}
