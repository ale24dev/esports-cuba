// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerBaseModel _$PlayerBaseModelFromJson(Map<String, dynamic> json) =>
    PlayerBaseModel(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      country: json['country'] as String,
      popular: json['popular'] as bool,
    );

Map<String, dynamic> _$PlayerBaseModelToJson(PlayerBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'name': instance.name,
      'image': instance.image,
      'country': instance.country,
      'popular': instance.popular,
    };
