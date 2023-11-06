

import 'package:e_commerce_app/Data/api/Api_Manager.dart';
import 'package:e_commerce_app/Domain/UseCase/Register_UseCase.dart';
import 'package:e_commerce_app/Domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce_app/Register/cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
 RegisterUseCase registerUseCase;
  // var apimanager =ApiManager();
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());


  var nameController =TextEditingController();

  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  var confirmPasswordController =TextEditingController();

  var phoneController =TextEditingController();

  var formKey=GlobalKey<FormState>();
  bool isObscure=true;

  void Register()async{
    if(formKey.currentState!.validate()){
      emit(RegisterLoadingState(LoadingMessage: 'wait'));


      var either = await registerUseCase.invoke(
          nameController.text, emailController.text,
          passwordController.text, confirmPasswordController.text,
          phoneController.text);
      either.fold((left) {
        emit(RegisterErrorState(ErrorMessage: left.ErrorMessage));

      },
              (right) {

        emit(RegisterSuccessState(registerResponse: right));
              });
    }

      
    }




}