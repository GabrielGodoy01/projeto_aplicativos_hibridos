// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$phraseAtom =
      Atom(name: '_HomeController.phrase', context: context);

  @override
  String get phrase {
    _$phraseAtom.reportRead();
    return super.phrase;
  }

  @override
  set phrase(String value) {
    _$phraseAtom.reportWrite(value, super.phrase, () {
      super.phrase = value;
    });
  }

  late final _$responseAtom =
      Atom(name: '_HomeController.response', context: context);

  @override
  String get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(String value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$postPhraseAsyncAction =
      AsyncAction('_HomeController.postPhrase', context: context);

  @override
  Future<dynamic> postPhrase() {
    return _$postPhraseAsyncAction.run(() => super.postPhrase());
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhrase(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setPhrase');
    try {
      return super.setPhrase(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
phrase: ${phrase},
response: ${response}
    ''';
  }
}
