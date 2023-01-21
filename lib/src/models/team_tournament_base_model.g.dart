// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_tournament_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamTournamentBaseModel _$TeamTournamentBaseModelFromJson(
        Map<String, dynamic> json) =>
    TeamTournamentBaseModel(
      id: json['id'] as int,
      active: json['active'] as bool,
      createdAt: Utils.parseDate(json['created_at']),
      team: json['Team'] == null
          ? null
          : TeamBaseModel.fromJson(json['Team'] as Map<String, dynamic>),
      tournament: json['Tournament'] == null
          ? null
          : TournamentBaseModel.fromJson(
              json['Tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamTournamentBaseModelToJson(
        TeamTournamentBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'created_at': instance.createdAt.toIso8601String(),
      'Team': instance.team?.toJson(),
      'Tournament': instance.tournament?.toJson(),
    };
