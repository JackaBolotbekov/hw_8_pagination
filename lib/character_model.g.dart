// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
  name: json['name'] as String,
  status: json['status'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'image': instance.image,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) =>
    InfoModel(next: json['next'] as String, prev: json['prev'] as String?);

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
  'next': instance.next,
  'prev': instance.prev,
};
