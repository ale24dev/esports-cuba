// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentBaseModel _$TournamentBaseModelFromJson(Map<String, dynamic> json) =>
    TournamentBaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      edition: json['edition'] as int,
      active: json['active'] as bool,
      createdAt: Utils.parseDate(json['created_at']),
      imageLogo: json['image_logo'] as String,
      imageHeader: json['image_header'] as String,
      description: json['description'] as String?,
      tournamentType: TournamentTypeBaseModel.fromJson(
          json['TournamentType'] as Map<String, dynamic>),
      game: GameBaseModel.fromJson(json['Game'] as Map<String, dynamic>),
      maxTeams: json['max_teams'] as int?,
      quantityGroups: json['quantity_groups'] as int?,
      tournamentState: TournamentStateBaseModel.fromJson(
          json['TournamentState'] as Map<String, dynamic>),
      winners: json['Winners'] == null
          ? null
          : WinnersBaseModel.fromJson(json['Winners'] as Map<String, dynamic>),
      prizepool: json['prizepool'] as int?,
    );

Map<String, dynamic> _$TournamentBaseModelToJson(
        TournamentBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'edition': instance.edition,
      'active': instance.active,
      'description': instance.description,
      'image_logo': instance.imageLogo,
      'image_header': instance.imageHeader,
      'quantity_groups': instance.quantityGroups,
      'max_teams': instance.maxTeams,
      'TournamentType': instance.tournamentType.toJson(),
      'TournamentState': instance.tournamentState.toJson(),
      'Game': instance.game.toJson(),
      'Winners': instance.winners?.toJson(),
      'prizepool': instance.prizepool,
      'created_at': instance.createdAt.toIso8601String(),
    };
