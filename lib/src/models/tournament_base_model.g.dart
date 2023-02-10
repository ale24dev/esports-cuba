// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentBaseModel _$TournamentBaseModelFromJson(Map<String, dynamic> json) =>
    TournamentBaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      game: json['game'] == null
          ? null
          : GameBaseModel.fromJson(json['game'] as Map<String, dynamic>),
      active: json['active'] as bool,
      edition: json['edition'] as int,
      popular: json['popular'] as bool,
      maxTeams: json['max_teams'] as int?,
      createdAt: Utils.parseDate(json['created_at']),
      image: json['image'] as String,
      individual: json['individual'] as bool,
      imageHeader: json['image_header'] as String,
      description: json['description'] as String,
      tournamentType: json['tournamenttype'] == null
          ? null
          : TournamentTypeBaseModel.fromJson(
              json['tournamenttype'] as Map<String, dynamic>),
      quantityGroups: json['quantity_groups'] as int?,
      tournamentState: json['tournamentstate'] == null
          ? null
          : TournamentStateBaseModel.fromJson(
              json['tournamentstate'] as Map<String, dynamic>),
      winners: json['winners'] == null
          ? null
          : WinnersBaseModel.fromJson(json['winners'] as Map<String, dynamic>),
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
      'individual': instance.individual,
      'popular': instance.popular,
      'tournamenttype': instance.tournamentType?.toJson(),
      'tournamentstate': instance.tournamentState?.toJson(),
      'game': instance.game?.toJson(),
      'winners': instance.winners?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
    };
