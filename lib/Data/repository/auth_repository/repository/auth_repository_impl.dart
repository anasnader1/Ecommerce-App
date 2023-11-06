import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/datasource/auth_remote_dataSource.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/dataSource/auth_remote_datasource_impl.dart';
import 'package:either_dart/either.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<BaseError,AuthResultEntity>> register(String name, String email, String password, String repassword, String phone) {
    return authRemoteDataSource.register(name, email, password, repassword, phone);

  }

  @override
  Login(String email, String password) {
  return  authRemoteDataSource.Login(email, password);


  }

}
