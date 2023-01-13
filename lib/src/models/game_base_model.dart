import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'game_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GameBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Nombre del juego
  String name;

  ///Imagen del juego
  String image;

  GameBaseModel({required this.id, required this.name, required this.image});

  factory GameBaseModel.fromJson(Map<String, dynamic> json) =>
      _$GameBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameBaseModelToJson(this);
}
