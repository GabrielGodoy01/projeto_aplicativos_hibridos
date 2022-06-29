import '../../domain/repositories/auth_repository_interface.dart';
import '../datasource/auth_datasource_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepository({required this.datasource});

  @override
  Future<bool> login(String user, String password) async {
    final response = datasource.login(user, password);
    return Future.value(response);
  }

  @override
  Future<bool> register(String user, String password) {
    final response = datasource.register(user, password);
    return Future.value(response);
  }
}
