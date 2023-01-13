import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'tournament_state_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TournamentStateBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Estado del torneo
  String state;

  TournamentStateBaseModel({required this.id, required this.state});

  factory TournamentStateBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentStateBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentStateBaseModelToJson(this);
}
