class CharacterModel {
  final List<Result> results;

  CharacterModel({required this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final list = (json['results'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(Result.fromJson)
        .toList();
    return CharacterModel(results: list);
  }

  Map<String, dynamic> toJson() => {
        'results': results.map((e) => e.toJson()).toList(),
      };
}

class Result {
  final String name;
  final String status;
  final String image;

  Result({
    required this.name,
    required this.status,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: (json['name'] ?? '') as String,
        status: (json['status'] ?? '') as String,
        image: (json['image'] ?? '') as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status,
        'image': image,
      };
}
