import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'winners_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WinnersBaseModel extends BaseModel {
  //Identificador
  int id;

  //Primer lugar
  @JsonKey(name: "first_place")
  String firstPlace;

  //Segundo lugar
  @JsonKey(name: "second_place")
  String secondPlace;

  //Tercer lugar
  @JsonKey(name: "third_place")
  String thirdPlace;

  WinnersBaseModel(
      {required this.id,
      required this.firstPlace,
      required this.secondPlace,
      required this.thirdPlace});

  factory WinnersBaseModel.fromJson(Map<String, dynamic> json) =>
      _$WinnersBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WinnersBaseModelToJson(this);
}
