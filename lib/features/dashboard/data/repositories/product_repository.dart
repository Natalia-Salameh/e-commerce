import 'package:ecommerce/features/dashboard/data/datasource/product_datasource.dart';
import 'package:ecommerce/features/dashboard/domain/entities/product_entity.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final products = await _dataSource.fetchProducts();
      return products
          .map((model) => ProductEntity(
                id: model.id,
                title: model.title,
                price: model.price,
                description: model.description,
                category: Category(
                  id: model.category.id,
                  name: model.category.name,
                  image: model.category.image,
                ),
                images: model.images,
              ))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
