import 'dart:convert';

import 'package:ecommerce/core/constants/linkapi.dart';
import 'package:ecommerce/core/networkHandler.dart';

import '../models/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<Map<String, dynamic>> signUp(SignUpModel signupModel);
}

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  @override
  Future<Map<String, dynamic>> signUp(SignUpModel signupModel) async {
    final response = await NetworkHandler.postRequest(
      AppLink.signUp,
      signupModel.toJson(),
    );
    return json.decode(response.body);
  }
}
