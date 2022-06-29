abstract class AuthRepositoryInterface {
  Future<bool> login(String user, String password);
  Future<bool> register(String user, String password);
}
