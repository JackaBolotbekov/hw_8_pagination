import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final InfoModel info;
  final List<ResultModel> results;

  const CharacterModel({
    required this.info,
    required this.results,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

@JsonSerializable()
class ResultModel {
  final String name;
  final String status;
  final String image;

  const ResultModel({
    required this.name,
    required this.status,
    required this.image,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

@JsonSerializable()
class InfoModel {
  final String next;
  final String? prev;

  const InfoModel({
    required this.next,
    this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}