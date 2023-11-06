

import 'package:e_commerce_app/Domain/UseCase/GetAllBrandsUseCase.dart';
import 'package:e_commerce_app/Domain/UseCase/GetAllCategoriesUseCase.dart';
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/homescreen/Cubit/HomeTab_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit <HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase}):super(HomeTabInitialStates());
  List<CategoryOrBrandEntity>CategiresList=[];
  List<CategoryOrBrandEntity>BrandsList=[];

  void getCategories()async{
    emit(HomeTabLoadingStates(LoadingMessage: 'Loading..'));
   var either=await getAllCategoriesUseCase.invoke();
   either.fold((left) {

     emit(HomeTabErrorStates(ErrorMessage: left.ErrorMessage));
   },
           (right) {
     CategiresList =right.data??[];
             
     emit(HomeTabSuccessStates(responseEntity: right));
           });
   

  }

  void getBrands()async{
    emit(HomeTabLoadingStates(LoadingMessage: 'Loading..'));
     var either=await getAllBrandsUseCase.invoke();
   either.fold((left) {

     emit(HomeTabErrorStates(ErrorMessage: left.ErrorMessage));
   },
           (right) {
     BrandsList =right.data??[];

     emit(HomeTabSuccessStates(responseEntity: right));
           });


  }
}