import 'package:ecommerce/features/dashboard/domain/entities/category_entity.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryEntity>> execute() async {
    return await repository.getCategories();
  }
}
