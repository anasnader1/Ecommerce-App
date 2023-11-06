
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/homeRepsitoryContract.dart';
import 'package:either_dart/either.dart';

class GetAllCategoriesUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllCategoriesUseCase({required this.repositoryContract});

  Future<Either<BaseError, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getallCategories();
  }
}