import 'package:e_commerce_app/Domain/entities/AuthResultEntity.dart';

import 'UserDto.dart';
import 'Error.dart';

/// message : "success"
/// user : {"name":"anas","email":"anas1155@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2QyZWZhMzgwNGJjNjRkZTJlM2YyNSIsIm5hbWUiOiJhbmFzIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTg1MDg1MzksImV4cCI6MTcwNjI4NDUzOX0.Hz6_dn0G2IGhi3LrIeF3Z83_cRJj5urVS-VG77pV7gw"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,
  this.error});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  Error? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
}
}