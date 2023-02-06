import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'player_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerBaseModel extends BaseModel {
  ///Identificador
  String id;

  ///Nickname del usuario
  String nickname;

  ///Imagen del usuario
  String name;

  ///Correo del usuario
  String image;

  ///Correo del usuario
  String country;

  PlayerBaseModel({
    required this.id,
    required this.nickname,
    required this.name,
    required this.image,
    required this.country,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PlayerBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerBaseModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlayerBaseModelToJson(this);
}
