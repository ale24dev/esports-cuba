import 'package:esports_cuba/src/models/game_base_model.dart';
import 'package:esports_cuba/src/models/tournament_state_base_model.dart';
import 'package:esports_cuba/src/models/tournament_type_base_model.dart';
import 'package:esports_cuba/src/models/winners_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/models/base_model.dart';

part 'tournament_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TournamentBaseModel extends BaseModel {
  //Identificador
  int id;

  //Nombre torneo
  String name;

  //Edición del torneo
  int edition;

  //Bandera para saber si el torneo esta activo
  bool active;

  //Descripción del torneo
  String description;

  //Logo del torneo
  @JsonKey(name: "image")
  String image;

  //Imagen de cabecera del torneo
  @JsonKey(name: "image_header")
  String imageHeader;

  //Cantidad de grupos
  @JsonKey(name: "quantity_groups")
  int? quantityGroups;

  //máxima capacidad de equipos
  @JsonKey(name: "max_teams")
  int? maxTeams;

  //Premio del torneo
  int? prizepool;

  ///Determina si es popular
  bool popular;

  //Tipo de torneo
  @JsonKey(name: "tournamenttype")
  TournamentTypeBaseModel? tournamentType;

  //Tipo de torneo
  @JsonKey(name: "tournamentstate")
  TournamentStateBaseModel? tournamentState;

  //Juego perteneciente al torneo
  @JsonKey(name: "game")
  GameBaseModel? game;

  //Ganadores del torneo
  @JsonKey(name: "winners")
  WinnersBaseModel? winners;


  //Fecha de creación del torneo
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  TournamentBaseModel({
    required this.id,
    required this.name,
    required this.game,
    required this.active,
    required this.edition,
    required this.popular,
    required this.maxTeams,
    required this.createdAt,
    required this.image,
    required this.imageHeader,
    required this.description,
    required this.tournamentType,
    required this.quantityGroups,
    required this.tournamentState,
    this.winners,
    this.prizepool,
  });

  factory TournamentBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentBaseModelToJson(this);
}
