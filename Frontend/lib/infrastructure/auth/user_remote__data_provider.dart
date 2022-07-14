import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/rendering.dart';
import 'package:please/core/network/network_info.dart';
import 'package:please/domain/auth/shared_prefrenece_model.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:please/infrastructure/auth/shared_preference_repository.dart';
import 'package:please/infrastructure/auth/user_repository.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/response_model.dart';
import 'package:connectivity/connectivity.dart';

Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

String singupUrl = "http://localhost:8080/api/users/signup";
String loginUrl = "http://localhost:8080/api/users/login";
String editProfileUrl = "http://localhost:8080/api/users/editProfile";

class RemoteUserDataProvider implements UserRepository {
  @override
  Future<Either<AuthFailure, UserModel>>? editUser(
      {required String token, required User user}) async {
    var res =
        await http.put(Uri.parse(editProfileUrl), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      'x-auth-token': token,
    }, body: <String, String>{
      'name': user.name,
      'email': user.email,
      'password': user.password
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      UserModel result = UserModel.fromJson(data);
      return right(result);
    } else {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>>? loginUser(
      {required User user}) async {
    final connection = await isConnected();

    var res = await http.post(Uri.parse(loginUrl), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST, OPTIONS",
    }, body: <String, String>{
      'email': user.email,
      'password': user.password
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      UserModel result = UserModel.fromJson(data);
      return right(result);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);

      if (userResponse.message == 'Invalid email or password') {
        print('hey response: ${userResponse.message}');

        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
    }
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, UserModel>>? registerUser(
      {required User user}) async {
    var res = await http.post(Uri.parse(singupUrl), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true'
    }, body: <String, String>{
      'name': user.name,
      'email': user.email,
      'password': user.password
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      UserModel result = UserModel.fromJson(data);
      return right(result);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse errorReponse = ErrorReponse.fromJson(data);
      if (errorReponse.message == 'User already registered.') {
        return left(const AuthFailure.emailAlreadyInUse());
      }
    }
    return const Left(AuthFailure.serverError());
  }
}
