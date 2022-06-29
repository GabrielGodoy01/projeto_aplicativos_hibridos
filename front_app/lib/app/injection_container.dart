import 'package:dio/dio.dart';
import 'package:front_app/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:front_app/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:front_app/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:front_app/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:front_app/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:front_app/app/modules/login/controllers/login_controller.dart';
import 'package:front_app/app/modules/user/controllers/user_controller.dart';
import 'package:front_app/app/shared/services/dio_options.dart';
import 'package:get_it/get_it.dart';

import 'modules/home/controllers/home_controller.dart';
import 'modules/home/domain/repositories/feeling_repository_interface.dart';
import 'modules/home/external/feeling_datasource.dart';
import 'modules/home/infra/datasource/feeling_datasource_interface.dart';
import 'modules/home/infra/repositories/feeling_repository_impl.dart';
import 'modules/register/controllers/register_controller.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //service
  serviceLocator.registerLazySingleton<Dio>(() => Dio(dioOptions));

  //auth
  serviceLocator.registerLazySingleton<AuthRepositoryInterface>(
      () => AuthRepository(datasource: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthDatasourceInterface>(
      () => AuthDatasourceImpl(dio: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthController>(
      () => AuthController(authRepository: serviceLocator()));

  //login
  serviceLocator.registerLazySingleton<LoginController>(
      () => LoginController(authController: serviceLocator()));

  //register
  serviceLocator.registerLazySingleton<RegisterController>(
      () => RegisterController(authController: serviceLocator()));

  //home
  serviceLocator.registerLazySingleton<FeelingRepositoryInterface>(
      () => FeelingRepository(datasource: serviceLocator()));
  serviceLocator.registerLazySingleton<HomeController>(
      () => HomeController(repository: serviceLocator()));
  serviceLocator.registerLazySingleton<FeelingDatasourceInterface>(
      () => FeelingDatasource(dio: serviceLocator()));

  //user
  serviceLocator.registerLazySingleton<UserController>(
      () => UserController(repository: serviceLocator()));
}
