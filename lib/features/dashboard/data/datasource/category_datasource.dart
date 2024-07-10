import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:ecommerce/features/dashboard/data/models/category_model.dart';

class CategoryDataSource {
  Future<List<CategoryModel>> fetchCategories() async {
    var response = await NetworkHandler.getRequest(
      AppLink.categories,
      // queryParams: {'limit': 10}
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return categoryModelFromJson(response.body);
    } else {
      throw Exception('Failed to fetch categories: ${response.statusCode}');
    }
  }
}
