import 'package:front_app/app/modules/auth/errors/errors.dart';

import '../../domain/repositories/auth_repository_interface.dart';

class AuthRepositoryMock implements AuthRepositoryInterface {
  final String _email = '30557126659';
  final String _pw = 'user';

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    if (email != _email && password != _pw) {
      throw LoginInvalid('Login e/ou senha inválidos');
    } else {
      return {'name': 'Gabriel'};
    }
  }
}
