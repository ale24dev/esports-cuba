import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/shared/utils.dart';
import 'package:esports_cuba/src/models/base_model.dart';

part 'user_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Nickname del usuario
  String username;

  ///Imagen del usuario
  String email;

  ///Imagen del usuario
  String image;

  ///Imagen del usuario
  @JsonKey(fromJson: Utils.parseDate)
  DateTime birthday;

  ///Fecha de creación usuario
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  UserBaseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.birthday,
    required this.createdAt,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserBaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserBaseModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserBaseModelToJson(this);

  static int parseId(dynamic idToParse) {
    return idToParse is String ? int.parse(idToParse) : idToParse;
  }
}
