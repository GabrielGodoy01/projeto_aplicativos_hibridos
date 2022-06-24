import 'package:front_app/app/modules/home/model/card_model.dart';
import 'package:front_app/app/shared/model/list_panel_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  var list = <ListPanelModel>[
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
      model: CardModel(title: '4'),
    ),
    ListPanelModel(
      model: CardModel(title: '5'),
    ),
    ListPanelModel(
      model: CardModel(title: '6'),
    ),
    ListPanelModel(
      model: CardModel(title: '7'),
    ),
    ListPanelModel(
      model: CardModel(title: '8'),
    ),
    ListPanelModel(
      model: CardModel(title: '9'),
    ),
    ListPanelModel(
      model: CardModel(title: '10'),
    ),
    ListPanelModel(
      model: CardModel(title: '11'),
    ),
  ];

  @observable
  List<CardModel> selectFeeling = [];

  @action
  void alternateClick(int index, CardModel card) {
    var listToChange = List<ListPanelModel>.from(list);
    listToChange[index].changeStateIsOpen();
    list = listToChange;
    selectFeeling.contains(card)
        ? selectFeeling.removeWhere((element) => element.title == card.title)
        : selectFeeling.add(card);
  }
}
