import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'tournament_type_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TournamentTypeBaseModel extends BaseModel {
  //Identificador
  int id;
  //Nombre del tipo de torneo
  String name;

  TournamentTypeBaseModel({required this.id, required this.name});

  factory TournamentTypeBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentTypeBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentTypeBaseModelToJson(this);
}
