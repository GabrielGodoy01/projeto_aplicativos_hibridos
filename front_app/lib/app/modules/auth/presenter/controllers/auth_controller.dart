import '../../domain/repositories/auth_repository_interface.dart';

class AuthController {
  final AuthRepositoryInterface authRepository;

  bool _loggedIn = false;

  AuthController({
    required this.authRepository,
  });

  bool get isLogged => _loggedIn;

  Future<void> loginWithEmail(String email, String password) async {
    var loginResponse = await authRepository.login(email, password);
    _loggedIn = loginResponse;
  }

  Future<void> register(String email, String password) async {
    var registerResponse = await authRepository.register(email, password);
    _loggedIn = registerResponse;
  }

  Future<void> logout() async {
    _loggedIn = false;
  }
}
