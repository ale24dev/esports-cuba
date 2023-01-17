import 'package:esports_cuba/src/shared/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';

part 'version_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VersionBaseModel extends BaseModel {
  //Identificador
  int id;

  //Version de la app
  String version;

  //Describe si la app es stable o beta
  String status;

  //Define si es obligatorio actualizar la app para usarla
  @JsonKey(name: "breaking_change")
  bool breakingChange;

  //Fecha de creación del update
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  VersionBaseModel(
      {required this.id,
      required this.version,
      required this.status,
      required this.breakingChange,
      required this.createdAt,     
      });

  factory VersionBaseModel.fromJson(Map<String, dynamic> json) =>
      _$VersionBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VersionBaseModelToJson(this);
}
