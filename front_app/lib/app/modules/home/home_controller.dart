import 'package:front_app/app/modules/home/model/card_model.dart';
import 'package:front_app/app/shared/model/list_panel_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  List<ListPanelModel> list = [
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
    ListPanelModel(
      model: CardModel(title: 'Happy'),
    ),
  ];

  @action
  void alternateClick(int index) {
    list[index].changeStateIsOpen();
  }
}
