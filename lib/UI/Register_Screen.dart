import 'package:e_commerce_app/Data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/Domain/UseCase/Register_UseCase.dart';
import 'package:e_commerce_app/Domain/di.dart';
import 'package:e_commerce_app/UI/Login_Screen.dart';
import 'package:e_commerce_app/Register/cubit/Register_Screen_view_model.dart';
import 'package:e_commerce_app/Register/cubit/States.dart';
import 'package:e_commerce_app/Theme.dart';
import 'package:e_commerce_app/component/TextFieldItem.dart';
import 'package:e_commerce_app/component/custom_text_field.dart';
import 'package:e_commerce_app/dialogs_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterScreen extends StatefulWidget{
  static const String routeName='registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {




  var viewModel =RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());



  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel,RegisterStates>(
      bloc: viewModel,
     listener: (context, state){
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context, state.LoadingMessage??'waiting');

        }else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.shoeMessage(context, state.ErrorMessage??'',posActionName: 'Ok',title: 'Error');

        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.shoeMessage(context, state.registerResponse.userEntity?.name??'',
              posActionName: 'Ok',title: 'Success');
        }

     },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    'assets/images/Route.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'Full Name',
                                hintText: 'enter your name',
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'E-mail address',
                                hintText: 'enter your email address',
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your email address';
                                  }
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller: viewModel.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter password';
                                  }
                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return 'password should be >6 & <30';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                fieldName: 'Confirmation Password',
                                hintText: 'enter your confirmationPassword',
                                controller: viewModel.confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter rePassword';
                                  }
                                  if (value != viewModel.passwordController.text) {
                                    return "Password doesn't match";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                fieldName: 'Mobile Number',
                                hintText: 'enter your mobile no',
                                controller: viewModel.phoneController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your mobile no';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h,bottom: 30.h),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.Register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)))),
                          child: SizedBox(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );



  }


  }






