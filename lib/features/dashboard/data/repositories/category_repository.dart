import 'package:ecommerce/features/dashboard/data/datasource/category_datasource.dart';
import 'package:ecommerce/features/dashboard/domain/entities/category_entity.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource _dataSource;

  CategoryRepositoryImpl(this._dataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final categories = await _dataSource.fetchCategories();
      return categories
          .map((model) => CategoryEntity(
                id: model.id,
                name: model.name,
                image: model.image,
              ))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
