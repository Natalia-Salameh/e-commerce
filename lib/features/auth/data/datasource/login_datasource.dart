import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:ecommerce/features/auth/data/models/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<http.Response> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<http.Response> login(LoginModel loginModel) async {
    return await NetworkHandler.postRequest(
      AppLink.login,
      loginModel.toJson(),
    );
  }
}
