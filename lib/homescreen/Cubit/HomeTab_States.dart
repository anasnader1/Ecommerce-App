
import 'package:e_commerce_app/Domain/entities/CategoryEntity.dart';

abstract class HomeTabStates{}

class HomeTabInitialStates extends HomeTabStates{}
class HomeTabLoadingStates extends HomeTabStates{
  String? LoadingMessage;
  HomeTabLoadingStates({required this.LoadingMessage});
}
class HomeTabSuccessStates extends HomeTabStates{

  CategoryOrBrandResponseEntity responseEntity;
  HomeTabSuccessStates({required this.responseEntity});

}
class HomeTabErrorStates extends HomeTabStates{
  String?ErrorMessage;
  HomeTabErrorStates({required this.ErrorMessage});
}