import 'package:ecommerce/features/auth/data/datasource/login_datasource.dart';
import 'package:ecommerce/features/auth/data/repositories/login_repository.dart';
import 'package:ecommerce/features/auth/data/repositories/signup_repository.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repository.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:ecommerce/features/auth/data/datasource/signup_datasource.dart';
import 'package:ecommerce/features/auth/domain/repositories/signup_repository.dart';
import 'package:ecommerce/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecommerce/features/auth/presentation/controller/signup_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupRemoteDataSource>(() => SignupRemoteDataSourceImpl());
    Get.lazyPut<SignUpRepository>(() => SignUpRepositoryImpl(Get.find()));
    Get.lazyPut<SignupUseCase>(() => SignupUseCase(Get.find()));
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find()));

    Get.lazyPut<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find()));
    Get.lazyPut<LoginUsecase>(() => LoginUsecase(Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
