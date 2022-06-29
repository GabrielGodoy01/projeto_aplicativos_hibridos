import 'package:dio/dio.dart';
import 'package:front_app/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:front_app/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:front_app/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:front_app/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:front_app/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:front_app/app/modules/login/controllers/login_controller.dart';
import 'package:front_app/app/modules/user/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

import 'modules/home/controllers/home_controller.dart';
import 'modules/register/controllers/register_controller.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //external
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  //auth
  serviceLocator.registerLazySingleton<AuthRepositoryInterface>(
      () => AuthRepository(datasource: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthDatasourceInterface>(
      () => AuthDatasourceImpl());
  serviceLocator.registerLazySingleton<AuthController>(
      () => AuthController(authRepository: serviceLocator()));

  //login
  serviceLocator.registerLazySingleton<LoginController>(
      () => LoginController(authController: serviceLocator()));

  //register
  serviceLocator.registerLazySingleton<RegisterController>(
      () => RegisterController(authController: serviceLocator()));

  //home
  serviceLocator.registerLazySingleton<HomeController>(() => HomeController());

  //user
  serviceLocator.registerLazySingleton<UserController>(() => UserController());
}
