import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:ecommerce/features/dashboard/data/models/product_models.dart';

class ProductDataSource {

  Future<List<ProductModel>> fetchProducts() async {
    var response = await NetworkHandler.getRequest(AppLink.products);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to fetch products: ${response.statusCode}');
    }
  }
}
