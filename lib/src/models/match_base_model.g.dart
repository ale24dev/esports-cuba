// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchBaseModel _$MatchBaseModelFromJson(Map<String, dynamic> json) =>
    MatchBaseModel(
      id: json['id'] as int,
      createdAt: Utils.parseDate(json['created_at']),
      resultLocal: json['result_local'] as int?,
      resultVisitant: json['result_visitant'] as int?,
      winner: json['winner'] as String?,
      tournament: TournamentBaseModel.fromJson(
          json['tournament'] as Map<String, dynamic>),
      teamLocal: json['team_local'] == null
          ? null
          : TeamBaseModel.fromJson(json['team_local'] as Map<String, dynamic>),
      teamVisitant: json['team_visitant'] == null
          ? null
          : TeamBaseModel.fromJson(
              json['team_visitant'] as Map<String, dynamic>),
      playerLocal: json['player_local'] == null
          ? null
          : PlayerBaseModel.fromJson(
              json['player_local'] as Map<String, dynamic>),
      playerVisitant: json['player_visitant'] == null
          ? null
          : PlayerBaseModel.fromJson(
              json['player_visitant'] as Map<String, dynamic>),
      state:
          MatchStateBaseModel.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchBaseModelToJson(MatchBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'winner': instance.winner,
      'result_local': instance.resultLocal,
      'result_visitant': instance.resultVisitant,
      'tournament': instance.tournament.toJson(),
      'team_local': instance.teamLocal?.toJson(),
      'team_visitant': instance.teamVisitant?.toJson(),
      'player_local': instance.playerLocal?.toJson(),
      'player_visitant': instance.playerVisitant?.toJson(),
      'state': instance.state.toJson(),
    };
