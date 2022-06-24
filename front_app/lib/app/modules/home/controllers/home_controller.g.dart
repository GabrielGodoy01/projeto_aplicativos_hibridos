// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$listAtom = Atom(name: '_HomeController.list', context: context);

  @override
  List<ListPanelModel<dynamic>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<ListPanelModel<dynamic>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$selectFeelingAtom =
      Atom(name: '_HomeController.selectFeeling', context: context);

  @override
  List<CardModel> get selectFeeling {
    _$selectFeelingAtom.reportRead();
    return super.selectFeeling;
  }

  @override
  set selectFeeling(List<CardModel> value) {
    _$selectFeelingAtom.reportWrite(value, super.selectFeeling, () {
      super.selectFeeling = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void alternateClick(int index, CardModel card) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.alternateClick');
    try {
      return super.alternateClick(index, card);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
selectFeeling: ${selectFeeling}
    ''';
  }
}
