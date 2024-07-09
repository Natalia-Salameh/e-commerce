import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';
import 'package:http/http.dart' as http;

abstract class SignUpRepository {
  Future<http.Response> signUp(SignUpEntity signupEntity);
}
