import 'package:ecommerce/features/dashboard/domain/entities/product_entity.dart';
import 'package:ecommerce/features/dashboard/domain/usecases/product_usecase.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final GetProducts _fetchProductsUseCase;

  ProductController(this._fetchProductsUseCase);

  RxList<ProductEntity> products = RxList<ProductEntity>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      List<ProductEntity> fetchedProducts = await _fetchProductsUseCase.execute();
      products.assignAll(fetchedProducts.take(10).toList());
    } catch (e) {
      print('Failed to fetch products: $e');
    }
  }
}
