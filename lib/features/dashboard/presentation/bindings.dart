import 'package:ecommerce/features/dashboard/data/datasource/category_datasource.dart';
import 'package:ecommerce/features/dashboard/data/datasource/product_datasource.dart';
import 'package:ecommerce/features/dashboard/data/repositories/category_repository.dart';
import 'package:ecommerce/features/dashboard/data/repositories/product_repository.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/category_repository.dart';
import 'package:ecommerce/features/dashboard/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/dashboard/domain/usecases/category_usecase.dart';
import 'package:ecommerce/features/dashboard/presentation/controller/category_controller.dart';
import 'package:ecommerce/features/dashboard/presentation/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:ecommerce/features/dashboard/domain/usecases/product_usecase.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDataSource>(() => ProductDataSource());
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(Get.find()));
    Get.lazyPut<GetProducts>(() => GetProducts(Get.find()));
    Get.lazyPut<ProductController>(() => ProductController(Get.find()));

    Get.lazyPut<CategoryDataSource>(() => CategoryDataSource());
    Get.lazyPut<CategoryRepository>(() => CategoryRepositoryImpl(Get.find()));
    Get.lazyPut<GetCategories>(() => GetCategories(Get.find()));
    Get.lazyPut<CategoryController>(() => CategoryController(Get.find()));

  }
}
