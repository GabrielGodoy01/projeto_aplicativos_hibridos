import 'package:mobx/mobx.dart';

import '../../shared/model/feeling_historic_model.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  @observable
  List<FeelingHistoricModel> list = [
    FeelingHistoricModel(
      title: 'Hoje fiz sexo',
      description:
          'Você se sentiu feliz pra caralho Você se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralho',
      date: DateTime.now(),
    ),
    FeelingHistoricModel(
      title: 'Hoje fiz sexo',
      description:
          'Você se sentiu feliz pra caralho Você se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralho',
      date: DateTime.now(),
    ),
    FeelingHistoricModel(
      title: 'Hoje fiz sexo',
      description:
          'Você se sentiu feliz pra caralho Você se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralho',
      date: DateTime.now(),
    ),
    FeelingHistoricModel(
      title: 'Hoje fiz sexo',
      description:
          'Você se sentiu feliz pra caralho Você se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralho',
      date: DateTime.now(),
    ),
  ];
}
