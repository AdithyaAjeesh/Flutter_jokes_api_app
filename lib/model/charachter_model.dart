
class CharachterModel {
  final String id;
  final String joke;

  CharachterModel({required this.id, required this.joke});

  factory CharachterModel.fromJson(Map<String, dynamic> json) {
    return CharachterModel(
      id: json['id'],
      joke: json['value'],
    );
  }
}
