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
  var isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  var phrase = '';

  @observable
  var response = '';

  @action
  void setPhrase(String value) {
    phrase = value;
  }

  @action
  Future postPhrase() async {
    setIsLoading(true);
    response = await repository.postPhrase(phrase);
    setIsLoading(false);
  }
}
