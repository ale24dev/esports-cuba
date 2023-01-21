import 'package:esports_cuba/src/models/team_base_model.dart';
import 'package:esports_cuba/src/models/tournament_base_model.dart';
import 'package:esports_cuba/src/shared/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/models/base_model.dart';

part 'team_tournament_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamTournamentBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Título del anuncio
  bool active;

  //Fecha de creación del anuncio
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  ///Usuario que realiza el anuncio
  @JsonKey(name: "Team")
  TeamBaseModel? team;

  ///Usuario que realiza el anuncio
  @JsonKey(name: "Tournament")
  TournamentBaseModel? tournament;

  TeamTournamentBaseModel({
    required this.id,
    required this.active,
    required this.createdAt,
    required this.team,
    required this.tournament,
  });

  factory TeamTournamentBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TeamTournamentBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamTournamentBaseModelToJson(this);
}
