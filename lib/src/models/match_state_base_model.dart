import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'match_state_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchStateBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Estado del partido
  String state;

  MatchStateBaseModel({required this.id, required this.state});

  factory MatchStateBaseModel.fromJson(Map<String, dynamic> json) =>
      _$MatchStateBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchStateBaseModelToJson(this);
}
