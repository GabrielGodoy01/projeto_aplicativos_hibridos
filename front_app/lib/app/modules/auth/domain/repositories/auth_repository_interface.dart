abstract class AuthRepositoryInterface {
  Future<Map<String, dynamic>> login(String user, String password);
}
