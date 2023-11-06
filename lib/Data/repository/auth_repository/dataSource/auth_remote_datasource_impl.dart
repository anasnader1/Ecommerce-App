import 'package:e_commerce_app/Data/api/Api_Manager.dart';
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/datasource/auth_remote_dataSource.dart';
import 'package:either_dart/either.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<BaseError,AuthResultEntity>> register(String name, String email, String password, String repassword, String phone)async {
    var either=await apiManager.register(name, email, password, repassword, phone);
   return either.fold((left) {
      return Left(BaseError(ErrorMessage:left.ErrorMessage));
    },
            (right) {
      return Right(right.toAuthResultEntity());
            });

  }

  @override
  Future<Either<BaseError, AuthResultEntity>> Login(String email, String password)async {
  var either =await  apiManager.login(email, password);
  return either.fold((left) {
   return Left(BaseError(ErrorMessage: left.ErrorMessage));
  },
          (right) {

   return Right(right.toAuthResultEntity());
          });
  }



}
