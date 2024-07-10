import 'package:ecommerce/features/dashboard/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
