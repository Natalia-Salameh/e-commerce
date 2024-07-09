import 'package:ecommerce/features/auth/data/datasource/login_datasource.dart';
import 'package:ecommerce/features/auth/data/models/login_model.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repository.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<http.Response> login(LoginEntity loginEntity) async {
    final loginModel = LoginModel(
      email: loginEntity.email,
      password: loginEntity.password,
    );
    return await remoteDataSource.login(loginModel);
  }
}
