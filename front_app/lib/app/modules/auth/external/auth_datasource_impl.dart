import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infra/datasource/auth_datasource_interface.dart';

class AuthDatasourceImpl implements AuthDatasourceInterface {
  Dio dio;
  AuthDatasourceImpl({
    required this.dio,
  });

  @override
  Future<bool> login(user, password) async {
    try {
      var body = {'user': user, 'password': password};
      var res = await dio.post('/login', data: body);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      log(e.message);
      Get.snackbar(
        'O seguinte erro ocorreu: ',
        e.message,
        backgroundColor: Colors.white,
      );
      rethrow;
    }
  }

  @override
  Future<bool> register(String user, String password) async {
    try {
      var body = {'user': user, 'password': password};
      var res = await dio.post('/singup', data: body);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      log(e.message);
      Get.snackbar(
        'O seguinte erro ocorreu: ',
        e.message,
        backgroundColor: Colors.white,
      );
      rethrow;
    }
  }
}
