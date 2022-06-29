import 'package:dio/dio.dart';

final dioOptions = BaseOptions(
  baseUrl: 'http://localhost:8000',
  responseType: ResponseType.json,
  connectTimeout: 30000,
  receiveTimeout: 30000,
);
