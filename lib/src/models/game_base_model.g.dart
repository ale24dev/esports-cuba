// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameBaseModel _$GameBaseModelFromJson(Map<String, dynamic> json) =>
    GameBaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$GameBaseModelToJson(GameBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
