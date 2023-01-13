// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_state_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentStateBaseModel _$TournamentStateBaseModelFromJson(
        Map<String, dynamic> json) =>
    TournamentStateBaseModel(
      id: json['id'] as int,
      state: json['state'] as String,
    );

Map<String, dynamic> _$TournamentStateBaseModelToJson(
        TournamentStateBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
    };
