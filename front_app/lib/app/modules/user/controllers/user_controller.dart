import 'package:front_app/app/modules/home/domain/repositories/feeling_repository_interface.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/model/feeling_historic_model.dart';
part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  FeelingRepositoryInterface repository;
  _UserController({
    required this.repository,
  }) {
    getMyHistoric();
  }

  @observable
  List<FeelingHistoricModel> list = [];

  void getMyHistoric() async {
    list = await repository.getHistoric();
  }
}
