import 'package:esports_cuba/src/shared/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'team_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Nombre del equipo
  String name;

  ///País del equipo
  String country;

  ///Nombre del CEO
  String? ceo;

  ///Determina si es popular
  bool popular;

  ///Imagen de cabecera del equipo
  @JsonKey(name: "image_header")
  String imageHeader;

  ///Imagen del equipo
  @JsonKey(name: "image")
  String image;

  //Fecha de creación del equipo
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  TeamBaseModel({
    required this.id,
    required this.name,
    required this.country,
    required this.ceo,
    required this.createdAt,
    required this.image,
    required this.imageHeader,
    required this.popular,
  });

  factory TeamBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TeamBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamBaseModelToJson(this);
}
