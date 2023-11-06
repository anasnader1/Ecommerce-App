import 'package:e_commerce_app/Data/api/Api_Manager.dart';
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/datasource/Home_Remote_DataSource.dart';
import 'package:either_dart/src/either.dart';

class HomeRemoteDataSourceimpl extends HomeRemoteDataSource{
  ApiManager apiManager;
  HomeRemoteDataSourceimpl({required this.apiManager});

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>> getallCategories() async{
    var either=await apiManager.getCategories();
   return either.fold((left) {
     return Left(BaseError(ErrorMessage: left.ErrorMessage));

    },
           (right) {
     return Right(right);



            });
  }

  @override
  Future<Either<BaseError, CategoryOrBrandResponseEntity>> getallBrands()async {
    var either=await apiManager.getBrands();
    return either.fold((left) {
      return Left(BaseError(ErrorMessage: left.ErrorMessage));

    },
            (right) {
          return Right(right);



        });

  }

}