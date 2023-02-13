// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RosterBaseModel _$RosterBaseModelFromJson(Map<String, dynamic> json) =>
    RosterBaseModel(
      id: json['id'] as int,
      team: json['team'] == null
          ? null
          :TeamBaseModel.fromJson(json['team'] as Map<String, dynamic>),
      player: PlayerBaseModel.fromJson(json['player'] as Map<String, dynamic>),
      tournament: TournamentBaseModel.fromJson(
          json['tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RosterBaseModelToJson(RosterBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team?.toJson(),
      'player': instance.player.toJson(),
      'tournament': instance.tournament.toJson(),
    };
