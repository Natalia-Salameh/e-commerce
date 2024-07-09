
import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repository.dart';


import 'package:http/http.dart' as http;

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  Future<http.Response> execute(LoginEntity loginEntity) {
    return repository.login(loginEntity);
  }
}
