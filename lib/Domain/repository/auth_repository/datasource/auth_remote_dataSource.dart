import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';
import 'package:either_dart/either.dart';

import '../../../../Data/api/Base_Error.dart';

abstract class AuthRemoteDataSource{

  Future<Either<BaseError,AuthResultEntity>>  register(String name,String email,String password,String repassword,String phone);
  Future<Either<BaseError,AuthResultEntity>>Login(String email,String password);

}