import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

import 'team_base_model.dart';
import 'player_base_model.dart';
import 'tournament_base_model.dart';

part 'roster_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RosterBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Equipo
  TeamBaseModel? team;

  ///Player
  PlayerBaseModel player;

  ///Torneo
  TournamentBaseModel tournament;

  RosterBaseModel(
      {required this.id,
      this.team,
      required this.player,
      required this.tournament});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory RosterBaseModel.fromJson(Map<String, dynamic> json) =>
      _$RosterBaseModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RosterBaseModelToJson(this);
}
