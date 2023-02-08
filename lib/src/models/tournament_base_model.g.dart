// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentBaseModel _$TournamentBaseModelFromJson(Map<String, dynamic> json) =>
    TournamentBaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      game: json['Game'] == null
          ? null
          : GameBaseModel.fromJson(json['Game'] as Map<String, dynamic>),
      active: json['active'] as bool,
      edition: json['edition'] as int,
      popular: json['popular'] as bool,
      maxTeams: json['max_teams'] as int?,
      createdAt: Utils.parseDate(json['created_at']),
      image: json['image'] as String,
      imageHeader: json['image_header'] as String,
      description: json['description'] as String,
      tournamentType: json['TournamentType'] == null
          ? null
          : TournamentTypeBaseModel.fromJson(
              json['TournamentType'] as Map<String, dynamic>),
      quantityGroups: json['quantity_groups'] as int?,
      tournamentState: json['TournamentState'] == null
          ? null
          : TournamentStateBaseModel.fromJson(
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
      'image': instance.image,
      'image_header': instance.imageHeader,
      'quantity_groups': instance.quantityGroups,
      'max_teams': instance.maxTeams,
      'prizepool': instance.prizepool,
      'popular': instance.popular,
      'TournamentType': instance.tournamentType?.toJson(),
      'TournamentState': instance.tournamentState?.toJson(),
      'Game': instance.game?.toJson(),
      'Winners': instance.winners?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
    };
