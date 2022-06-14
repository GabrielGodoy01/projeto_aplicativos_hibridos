import 'package:mobx/mobx.dart';

import '../auth/errors/errors.dart';
import '../auth/presenter/controllers/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;

  _LoginController({required this.authController});

  @observable
  bool passwordVisibility = true;

  @observable
  String errors = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login() async {
    try {
      await authController.loginWithEmail(email, password);
      if (authController.isLogged) {}
    } on Failure catch (e) {
      errors = e.message;
    }
  }

  @action
  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
  }
}
