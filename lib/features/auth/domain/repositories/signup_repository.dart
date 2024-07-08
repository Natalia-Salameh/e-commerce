import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';

abstract class SignUpRepository {
  Future<Map<String, dynamic>> signUp(SignUpEntity signupEntity);
}
