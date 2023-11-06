
import 'package:e_commerce_app/Domain/UseCase/Login_UseCase.dart';
import 'package:e_commerce_app/Domain/di.dart';
import 'package:e_commerce_app/Login/cubit/LoginStates.dart';
import 'package:e_commerce_app/Login/cubit/loginScreen_viewModel.dart';
import 'package:e_commerce_app/UI/Register_Screen.dart';
import 'package:e_commerce_app/Theme.dart';
import 'package:e_commerce_app/component/TextFieldItem.dart';
import 'package:e_commerce_app/component/custom_text_field.dart';
import 'package:e_commerce_app/dialogs_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget{

  static const String routeName='LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel=LoginScreenViewModel(loginUseCase:injectLoginUseCase() );

  @override
  // var nameController = TextEditingController()
  // var confirmPasswordController = TextEditingController();;


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel,LoginStates>(

      bloc: viewModel,
      listener: (context, state) {
        if(state is LoginLoadinglStates){
          DialogUtils.showLoading(context, state.loadingMessage??'waiting');

        }else if (state is LoginErrorStates){
          DialogUtils.hideLoading(context);
          DialogUtils.shoeMessage(context, state.errorMessage??'',posActionName: 'Ok',title: 'Error');

        }else if(state is LoginSuccessStates){
          DialogUtils.hideLoading(context);
          DialogUtils.shoeMessage(context, state.response.userEntity?.name??'',
              posActionName: 'Ok',title: 'Success');

        }
      },
      child:Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    'assets/images/Route.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome Back To Route',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'E-mail address',
                                hintText: 'enter your email address',
                                controller:  viewModel.emailController,
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
                                  return null ;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller:  viewModel.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter password';
                                  }
                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return 'password should be >6 & <30';
                                  }
                                  return null ;
                                },
                                isObscure:  viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child:  viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if ( viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.Login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)))),
                          child: Container(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                'Login',
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
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account? ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                              child: Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        ),
                      )
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

