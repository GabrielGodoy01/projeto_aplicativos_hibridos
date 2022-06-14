import 'package:dio/dio.dart';
import '../infra/datasource/auth_datasource_interface.dart';

class AuthDatasourceImpl implements AuthDatasourceInterface {
  final Dio dioClient;

  AuthDatasourceImpl({required this.dioClient});
  @override
  Future<bool> login(email, password) async {
    return true;
  }
}
