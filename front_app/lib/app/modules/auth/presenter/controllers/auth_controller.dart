import '../../domain/repositories/auth_repository_interface.dart';

class AuthController {
  final AuthRepositoryInterface authRepository;

  bool _loggedIn = false;
  String _name = '';

  AuthController({
    required this.authRepository,
  });

  bool get isLogged => _loggedIn;
  String get name => _name;

  Future<void> loginWithEmail(String email, String password) async {
    var loginResponse = await authRepository.login(email, password);
    _name = loginResponse['name'];
    _loggedIn = true;
  }

  Future<void> logout() async {
    _loggedIn = false;
  }
}
