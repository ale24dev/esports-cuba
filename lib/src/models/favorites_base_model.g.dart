// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesBaseModel _$FavoritesBaseModelFromJson(Map<String, dynamic> json) =>
    FavoritesBaseModel(
      id: json['id'] as int,
      userBaseModel:
          UserBaseModel.fromJson(json['User'] as Map<String, dynamic>),
      newsBaseModel:
          NewsBaseModel.fromJson(json['News'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesBaseModelToJson(FavoritesBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'User': instance.userBaseModel.toJson(),
      'News': instance.newsBaseModel.toJson(),
    };
