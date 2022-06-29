// ignore_for_file: file_names

import 'package:front_app/app/modules/home/infra/datasource/feeling_datasource_interface.dart';

import '../../../../shared/model/feeling_historic_model.dart';
import '../../domain/repositories/feeling_repository_interface.dart';

class FeelingRepository implements FeelingRepositoryInterface {
  FeelingDatasourceInterface datasource;
  FeelingRepository({
    required this.datasource,
  });

  var feelingList = <FeelingHistoricModel>[
    FeelingHistoricModel(
      title: 'Hoje fiz sexo',
      description:
          'Você se sentiu feliz pra caralho Você se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralhoVocê se sentiu feliz pra caralho',
      date: DateTime.now(),
    ),
  ];

  @override
  Future<String> postPhrase(String phrase) async {
    var response = await datasource.myFeeling(phrase);
    var toAdd = FeelingHistoricModel(
        title: response, description: phrase, date: DateTime.now());
    feelingList.add(toAdd);
    return Future.value(response);
  }

  @override
  List<FeelingHistoricModel> getHistoric() {
    return feelingList;
  }
}
