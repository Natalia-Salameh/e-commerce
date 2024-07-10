import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';

import '../repositories/signup_repository.dart';

import 'package:http/http.dart' as http;

class SignupUseCase {
  final SignUpRepository repository;

  SignupUseCase(this.repository);

  Future<http.Response> execute(SignUpEntity signupEntity) {
    return repository.signUp(signupEntity);
  }
  
}
