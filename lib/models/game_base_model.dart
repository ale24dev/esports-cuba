import 'package:esports_cuba/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GameBaseModel extends BaseModel {
  int id;

  String name;

  String image;

  GameBaseModel({required this.id, required this.name, required this.image});

  factory GameBaseModel.fromJson(Map<String, dynamic> json) =>
      _$GameBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameBaseModelToJson(this);
}
