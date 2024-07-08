import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';

import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignUpRepository repository;

  SignupUseCase(this.repository);

  Future<Map<String, dynamic>> execute(SignUpEntity signupEntity) {
    return repository.signUp(signupEntity);
  }
}
