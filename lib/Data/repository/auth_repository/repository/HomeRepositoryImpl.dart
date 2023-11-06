
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/datasource/Home_Remote_DataSource.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/homeRepsitoryContract.dart';
import 'package:either_dart/src/either.dart';

class HomeRepositoryimp extends HomeRepositoryContract{
   HomeRemoteDataSource homeRemoteDataSource;
   HomeRepositoryimp({required this.homeRemoteDataSource});

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>> getallCategories() {
    return homeRemoteDataSource.getallCategories();
  }

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>> getallBrands() {
    return homeRemoteDataSource.getallBrands();
  }

}