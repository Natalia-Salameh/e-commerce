import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:http/http.dart' as http;
import '../models/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<http.Response> signUp(SignUpModel signupModel);
}

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  @override
  Future<http.Response> signUp(SignUpModel signupModel) async {
    return await NetworkHandler.postRequest(
      AppLink.signUp,
      signupModel.toJson(),
    );
  }
}
