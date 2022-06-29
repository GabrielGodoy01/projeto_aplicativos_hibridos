import '../../../../shared/model/feeling_historic_model.dart';

abstract class FeelingRepositoryInterface {
  Future<String> postPhrase(String phrase);
  Future<List<FeelingHistoricModel>> getHistoric();
}
