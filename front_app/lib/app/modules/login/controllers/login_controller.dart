import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../auth/errors/errors.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

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
  String user = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @action
  void setEmail(String value) {
    user = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login() async {
    try {
      await authController.loginWithEmail(user, password);
      if (authController.isLogged) {
        Get.toNamed('/home');
      }
    } on Failure catch (e) {
      errors = e.message;
    }
  }

  @action
  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
  }
}
