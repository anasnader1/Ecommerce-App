
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:either_dart/either.dart';

import '../entities/AuthResultEntity.dart';

class LoginUseCase{
AuthRepositoryContract  repositoryContract;
LoginUseCase({required this.repositoryContract});
Future<Either<BaseError,AuthResultEntity>>invoke(String email,String password)async{
    var either=await repositoryContract.Login(email, password);
    return either.fold((left) {

      return Left(BaseError(ErrorMessage: left.ErrorMessage));
    },
            (right) {
              
      return Right(right);
            });
}
}
