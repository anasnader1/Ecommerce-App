
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';
import 'package:either_dart/either.dart';

abstract class HomeRemoteDataSource{
  Future<Either<BaseError,CategoryOrBrandResponseEntity>>getallCategories();
  Future<Either<BaseError,CategoryOrBrandResponseEntity>>getallBrands();

}
abstract class HomeLocalDataSource{
  Future<Either<BaseError,CategoryOrBrandResponseEntity>>getallCategories();
  Future<Either<BaseError,CategoryOrBrandResponseEntity>>getallBrands();

}