import 'package:ecommerce/features/dashboard/domain/entities/product_entity.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<ProductEntity>> execute() async {
    return await repository.getProducts();
  }
}
