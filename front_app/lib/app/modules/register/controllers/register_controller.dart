import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../auth/errors/errors.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final AuthController authController;

  _RegisterController({required this.authController});

  @observable
  bool passwordVisibility = true;

  @observable
  String errors = '';

  @observable
  String email = '';

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
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> register() async {
    try {
      await authController.register(email, password);
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
