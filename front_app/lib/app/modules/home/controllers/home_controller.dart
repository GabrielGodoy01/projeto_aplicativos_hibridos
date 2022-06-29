import 'package:mobx/mobx.dart';

import '../domain/repositories/feeling_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  FeelingRepositoryInterface repository;
  _HomeController({
    required this.repository,
  });

  @observable
  var phrase = '';

  @action
  void setPhrase(String value) {
    phrase = value;
  }

  @action
  Future postPhrase() async {
    await repository.postPhrase(phrase);
  }
}
