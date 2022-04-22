import 'package:flutter_config/flutter_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService {
  Dio dio = Dio();

  login(username, password) async {
    try {
      return await dio.post(FlutterConfig.get('WUX_READ_LOGIN_URL'),
          data: {"username": username, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  signup({username, password, email, firstName, lastName, userType}) async {
    try {
      return await dio.post(FlutterConfig.get('WUX_READ_SIGNUP_URL'),
          data: {
            "username": username,
            "password": password,
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "userType": userType
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
