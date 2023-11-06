import 'package:e_commerce_app/Domain/UseCase/Login_UseCase.dart';
import 'package:e_commerce_app/Login/cubit/LoginStates.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/api/Base_Error.dart';
import '../../Domain/entities/AuthResultEntity.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialStates());
  var emailController = TextEditingController();

  var passwordController = TextEditingController();



  var formKey = GlobalKey<FormState>();
  bool isObscure=true;

  void Login()async{
    if(formKey.currentState?.validate()==true){
      emit(LoginLoadinglStates(loadingMessage: 'Loading..'));
      var either=await loginUseCase.invoke(emailController.text, passwordController.text);

      either.fold((left) {
        emit(LoginErrorStates(errorMessage: left.ErrorMessage));


      },
              (right) {
        emit(LoginSuccessStates(response: right));
              });

    }

  }
}