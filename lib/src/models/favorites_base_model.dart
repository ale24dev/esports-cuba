import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';

part 'favorites_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoritesBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Usuario asociado a los favoritos
  @JsonKey(name: "User")
  UserBaseModel userBaseModel;

  ///Noticia guardada
  @JsonKey(name: "News")
  NewsBaseModel newsBaseModel;

  FavoritesBaseModel(
      {required this.id,
      required this.userBaseModel,
      required this.newsBaseModel});

  factory FavoritesBaseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesBaseModelToJson(this);
}
