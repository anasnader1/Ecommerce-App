
import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';

abstract class RegisterStates{}

class RegisterLoadingState extends RegisterStates{
  String? LoadingMessage;
  RegisterLoadingState({required this.LoadingMessage});
}
class RegisterErrorState extends RegisterStates{
  String? ErrorMessage;
  RegisterErrorState({required this.ErrorMessage});
}
class RegisterSuccessState extends RegisterStates{
AuthResultEntity registerResponse;
RegisterSuccessState({required this.registerResponse});
}
class RegisterInitialState extends RegisterStates{

}