import '../../../../shared/model/feeling_historic_model.dart';

abstract class FeelingRepositoryInterface {
  Future<String> postPhrase(String phrase);
  List<FeelingHistoricModel> getHistoric();
}
