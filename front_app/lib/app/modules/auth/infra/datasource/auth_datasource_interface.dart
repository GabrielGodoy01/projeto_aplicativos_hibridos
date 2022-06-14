abstract class AuthDatasourceInterface {
  Future<bool> login(String user, String password);
}
