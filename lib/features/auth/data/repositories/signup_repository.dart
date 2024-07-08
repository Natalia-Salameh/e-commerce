import 'package:ecommerce/features/auth/data/datasource/signup_datasource.dart';
import 'package:ecommerce/features/auth/data/models/signup_model.dart';
import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignUpRepository {
  final SignupRemoteDataSource remoteDataSource;

  SignupRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> signUp(SignUpEntity signupEntity) async {
    final signupModel = SignUpModel(
      email: signupEntity.email,
      name: signupEntity.name,
      password: signupEntity.password,
      role: signupEntity.role,
      avatar: signupEntity.avatar,
    );
    return await remoteDataSource.signUp(signupModel);
  }
}
