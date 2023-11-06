import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:either_dart/either.dart';

import '../../Data/api/Base_Error.dart';

class RegisterUseCase{
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCase({required this.authRepositoryContract});
 Future<Either<BaseError,AuthResultEntity>> invoke(String name,String email,String password,String repassword,String phone)async{
    var either= await authRepositoryContract.register(name, email, password, repassword, phone);
  return  either.fold((left) {
      return Left(BaseError(ErrorMessage: left.ErrorMessage));
    },
            (right) {
      return Right(right);
        });
  }
}
