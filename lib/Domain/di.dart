import 'package:e_commerce_app/Data/api/Api_Manager.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/dataSource/Home_remote_DataSource_impl.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/dataSource/auth_remote_datasource_impl.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/repository/HomeRepositoryImpl.dart';
import 'package:e_commerce_app/Data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/Domain/UseCase/GetAllBrandsUseCase.dart';
import 'package:e_commerce_app/Domain/UseCase/GetAllCategoriesUseCase.dart';
import 'package:e_commerce_app/Domain/UseCase/Login_UseCase.dart';
import 'package:e_commerce_app/Domain/UseCase/Register_UseCase.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/datasource/Home_Remote_DataSource.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/homeRepsitoryContract.dart';
import 'repository/auth_repository/datasource/auth_remote_dataSource.dart';
import 'repository/auth_repository/repository/auth_repository_contract.dart';

AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepository());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepositoryContract: injectAuthRepository());
}
GetAllCategoriesUseCase injectGetAllCategoriesUseCase(){
  return GetAllCategoriesUseCase(repositoryContract: injectHomeRepositoryContract());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase(){
  return GetAllBrandsUseCase(repositoryContract: injectHomeRepositoryContract());
}
HomeRepositoryContract injectHomeRepositoryContract(){
  return HomeRepositoryimp(homeRemoteDataSource: injectHomeRemoteDataSource());
}
HomeRemoteDataSource injectHomeRemoteDataSource(){
  return HomeRemoteDataSourceimpl(apiManager: ApiManager.getInstance());
}