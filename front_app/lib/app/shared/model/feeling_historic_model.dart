class FeelingHistoricModel {
  final String title;
  final DateTime date;
  final String description;

  FeelingHistoricModel(
      {required this.title, required this.date, required this.description});

  factory FeelingHistoricModel.fromMap(Map<String, dynamic> map) {
    return FeelingHistoricModel(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
    );
  }
  static List<FeelingHistoricModel> fromMaps(List array) {
    return array.map((e) => FeelingHistoricModel.fromMap(e)).toList();
  }
}
