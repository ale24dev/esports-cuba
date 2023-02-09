import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';

import 'player_base_model.dart';
import 'team_base_model.dart';
import 'tournament_base_model.dart';
import 'tournament_base_model.dart';

part 'favorites_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoritesBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Usuario 
  @JsonKey(name: "xuser")
  UserBaseModel userBaseModel;

  ///Equipo
  @JsonKey(name: "team")
  TeamBaseModel? teamBaseModel;

  ///Equipo
  @JsonKey(name: "tournament")
  TournamentBaseModel? tournamentBaseModel;

  ///Jugador
  @JsonKey(name: "player")
  PlayerBaseModel? playerBaseModel;

  FavoritesBaseModel(
      {required this.id,
      required this.userBaseModel,
      required this.teamBaseModel,
      required this.tournamentBaseModel,
      required this.playerBaseModel,
      });

  factory FavoritesBaseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesBaseModelToJson(this);
}
