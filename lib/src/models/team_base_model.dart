import 'package:esports_cuba/src/shared/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'team_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Título del anuncio
  String name;

  ///Usuario que realiza el anuncio
  String country;

  ///Usuario que realiza el anuncio
  String? ceo;

  ///Determina si es popular
  bool popular;

  ///Usuario que realiza el anuncio
  @JsonKey(name: "image_header")
  String imageHeader;

  ///Usuario que realiza el anuncio
  @JsonKey(name: "image")
  String image;

  //Fecha de creación del anuncio
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
