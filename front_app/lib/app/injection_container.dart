import 'package:dio/dio.dart';
import 'package:front_app/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:front_app/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:front_app/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:front_app/app/modules/auth/infra/repositories/auth_repository_mock.dart';
import 'package:front_app/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:front_app/app/modules/login/login_controller.dart';
import 'package:front_app/app/modules/user/user_controller.dart';
import 'package:get_it/get_it.dart';

import 'modules/home/home_controller.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //external
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  //auth
  serviceLocator.registerLazySingleton<AuthRepositoryInterface>(
      () => AuthRepositoryMock());
  serviceLocator.registerLazySingleton<AuthDatasourceInterface>(
      () => AuthDatasourceImpl(dioClient: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthController>(
      () => AuthController(authRepository: serviceLocator()));

  //login
  serviceLocator.registerLazySingleton<LoginController>(
      () => LoginController(authController: serviceLocator()));

  //home
  serviceLocator.registerLazySingleton<HomeController>(() => HomeController());

  //user
  serviceLocator.registerLazySingleton<UserController>(() => UserController());
}
