// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesBaseModel _$FavoritesBaseModelFromJson(Map<String, dynamic> json) =>
    FavoritesBaseModel(
      id: json['id'] as int,
      userBaseModel:
          UserBaseModel.fromJson(json['xuser'] as Map<String, dynamic>),
      teamBaseModel: json['team'] == null
          ? null
          : TeamBaseModel.fromJson(json['team'] as Map<String, dynamic>),
      tournamentBaseModel: json['tournament'] == null
          ? null
          : TournamentBaseModel.fromJson(
              json['tournament'] as Map<String, dynamic>),
      playerBaseModel: json['player'] == null
          ? null
          : PlayerBaseModel.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesBaseModelToJson(FavoritesBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'xuser': instance.userBaseModel.toJson(),
      'team': instance.teamBaseModel?.toJson(),
      'tournament': instance.tournamentBaseModel?.toJson(),
      'player': instance.playerBaseModel?.toJson(),
    };
