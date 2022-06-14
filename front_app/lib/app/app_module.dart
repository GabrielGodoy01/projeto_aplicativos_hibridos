import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_app/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/login',
      module: LoginModule(),
    ),
  ];
}
