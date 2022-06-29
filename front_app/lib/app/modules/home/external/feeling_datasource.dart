import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front_app/app/modules/home/infra/datasource/feeling_datasource_interface.dart';
import 'package:get/get.dart';

class FeelingDatasource implements FeelingDatasourceInterface {
  Dio dio;
  FeelingDatasource({
    required this.dio,
  });

  @override
  Future<String> myFeeling(String phrase) async {
    try {
      var body = {'feeling': phrase};
      var res = await dio.post('/predict', data: body);
      if (res.statusCode == 200) {
        return res.data;
      }
      throw Exception();
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
