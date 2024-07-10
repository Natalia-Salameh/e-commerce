import 'package:ecommerce/features/dashboard/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
}
