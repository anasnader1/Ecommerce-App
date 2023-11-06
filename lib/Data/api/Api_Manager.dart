
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/Data/api/Base_Error.dart';
import 'package:e_commerce_app/Data/model/request/Login_Request.dart';
import 'package:e_commerce_app/Data/model/request/Register_request.dart';
import 'package:e_commerce_app/Data/model/response/CategoryOrBrandResponseDm.dart';
import 'package:e_commerce_app/Data/model/response/LoginResponse.dart';
import 'package:e_commerce_app/Data/model/response/Register_response.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance!;
  }
   String baseUrl='ecommerce.routemisr.com';
   String registerApi='/api/v1/auth/signup';
   String loginApi='/api/v1/auth/signin';
   String getAllCategories ='/api/v1/categories';
   String getAllBrands ='/api/v1/brands';


   Future<Either<BaseError,RegisterResponse>>register(String name,String email,String password,String repassword,String phone)async{
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi) {
       Uri url=Uri.https(baseUrl,registerApi);
       var requestBody= RegisterRequest(
         name:name ,
         email: email,
         password: password,
         phone: phone,
         rePassword: repassword ,
       );
       var response=await http.post(url,body: requestBody.toJson());
       var registerResponse= RegisterResponse.fromJson(jsonDecode(response.body));
       if(response.statusCode>=200&&response.statusCode<300){
         return Right(registerResponse);
       }else{
         return Left(BaseError(ErrorMessage: registerResponse.message));
       }
       // I am connected to a mobile network.
     }else{
       return Left(BaseError(ErrorMessage: 'please check internet connection'));
     }

     /*
      https://ecommerce.routemisr.com/api/v1/auth/signup
       */


   }


   Future<Either<BaseError,LoginResponse>>login( String email,String password)async{
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi) {
       Uri url=Uri.https(baseUrl,loginApi);
       var requestBody= LoginRequest(

         email: email,
         password: password,

       );
       var response=await http.post(url,body: requestBody.toJson());
       var loginResponse= LoginResponse.fromJson(jsonDecode(response.body));
       if(response.statusCode>=200&&response.statusCode<300){
         return Right(loginResponse);
       }else{
         return Left(BaseError(ErrorMessage: loginResponse.message));
       }
       // I am connected to a mobile network.
     }else{
       return Left(BaseError(ErrorMessage: 'please check internet connection'));
     }

     /*
      https://ecommerce.routemisr.com/api/v1/auth/signup
       */


   }
  Future<Either<BaseError,CategoryOrBrandResponseDm>>getCategories( )async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi) {
      Uri url=Uri.https(baseUrl,getAllCategories);

      var response=await http.get(url);
      var CategoryResponse= CategoryOrBrandResponseDm.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200&&response.statusCode<300){
        return Right(CategoryResponse);
      }else{
        return Left(ServerError(ErrorMessage: CategoryResponse.message));
      }
      // I am connected to a mobile network.
    }else{
      return Left(NetworkError(ErrorMessage: 'please check internet connection'));
    }

    /*
      https://ecommerce.routemisr.com/api/v1/auth/signup
       */


  }


  Future<Either<BaseError,CategoryOrBrandResponseDm>>getBrands()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi) {
      Uri url=Uri.https(baseUrl,getAllBrands);

      var response=await http.get(url);
      var BrandsResponse= CategoryOrBrandResponseDm.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200&&response.statusCode<300){
        return Right(BrandsResponse);
      }else{
        return Left(ServerError(ErrorMessage: BrandsResponse.message));
      }
      // I am connected to a mobile network.
    }else{
      return Left(NetworkError(ErrorMessage: 'please check internet connection'));
    }

    /*
      https://ecommerce.routemisr.com/api/v1/auth/signup
       */


  }
}