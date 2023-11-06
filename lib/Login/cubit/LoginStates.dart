

import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';

abstract class  LoginStates{}

class LoginInitialStates extends LoginStates{}
class LoginErrorStates extends LoginStates{
  String? errorMessage;
  LoginErrorStates({required this.errorMessage});
}
class LoginLoadinglStates extends LoginStates{
  String? loadingMessage;
  LoginLoadinglStates({required this.loadingMessage});
}
class LoginSuccessStates extends LoginStates{
AuthResultEntity response;
LoginSuccessStates({required this.response});

}