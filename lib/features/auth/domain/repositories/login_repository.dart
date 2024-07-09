import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:http/http.dart' as http;

abstract class LoginRepository {
  Future<http.Response> login(LoginEntity loginEntity);
}
