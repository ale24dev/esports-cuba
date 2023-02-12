import 'package:esports_cuba/src/models/player_base_model.dart';
import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

import '../shared/utils.dart';
import 'match_state_base_model.dart';

part 'match_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchBaseModel extends BaseModel {
  ///Identificador
  int id;

  //Fecha del partido
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime? createdAt;

  ///Resultado del local
  @JsonKey(name: "result_local")
  int? resultLocal;

  ///Resultado del visitante
  @JsonKey(name: "result_visitant")
  int? resultVisitant;

  ///Torneo referente al partido
  TournamentBaseModel tournament;

  ///Equipo local
  @JsonKey(name: "team_local")
  TeamBaseModel? teamLocal;

  ///Equipo visitante
  @JsonKey(name: "team_visitant")
  TeamBaseModel? teamVisitant;

  ///Jugador local
  @JsonKey(name: "player_local")
  PlayerBaseModel? playerLocal;

  ///Jugador visitante
  @JsonKey(name: "player_visitant")
  PlayerBaseModel? playerVisitant;

  ///Estado actual del partido
  MatchStateBaseModel state;

  MatchBaseModel({
    required this.id,
    required this.createdAt,
    required this.resultLocal,
    required this.resultVisitant,
    required this.tournament,
    required this.teamLocal,
    required this.teamVisitant,
    required this.playerLocal,
    required this.playerVisitant,
    required this.state,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory MatchBaseModel.fromJson(Map<String, dynamic> json) =>
      _$MatchBaseModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MatchBaseModelToJson(this);
}
