class ListPanelModel<T> {
  final T model;
  bool _isClicked = false;

  ListPanelModel({required this.model});

  void changeStateIsOpen() {
    _isClicked = !_isClicked;
  }

  bool get isClicked => _isClicked;
}
