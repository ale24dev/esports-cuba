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
      teamBaseModel: json['Team'] == null
          ? null
          : TeamBaseModel.fromJson(json['Team'] as Map<String, dynamic>),
      tournamentBaseModel: json['Tournament'] == null
          ? null
          : TournamentBaseModel.fromJson(
              json['Tournament'] as Map<String, dynamic>),
      playerBaseModel: json['Player'] == null
          ? null
          : PlayerBaseModel.fromJson(json['Player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesBaseModelToJson(FavoritesBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'xuser': instance.userBaseModel.toJson(),
      'Team': instance.teamBaseModel?.toJson(),
      'Tournament': instance.tournamentBaseModel?.toJson(),
      'Player': instance.playerBaseModel?.toJson(),
    };
