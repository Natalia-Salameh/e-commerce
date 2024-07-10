import 'package:ecommerce/features/dashboard/domain/entities/category_entity.dart';
import 'package:ecommerce/features/dashboard/domain/usecases/category_usecase.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetCategories _fetchCategoriesUseCase;

  CategoryController(this._fetchCategoriesUseCase);

  RxList<CategoryEntity> categories = RxList<CategoryEntity>();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      List<CategoryEntity> fetchedCategories =
          await _fetchCategoriesUseCase.execute();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print('Failed to fetch categories: $e');
    }
  }
}
