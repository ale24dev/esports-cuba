import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/base_model.dart';
import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/models/news_base_model.dart';

part 'bookmark_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookmarkBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Usuario asociado a los favoritos
  @JsonKey(name: "xuser")
  UserBaseModel userBaseModel;

  ///Noticia guardada
  @JsonKey(name: "News")
  NewsBaseModel newsBaseModel;

  BookmarkBaseModel(
      {required this.id,
      required this.userBaseModel,
      required this.newsBaseModel});

  factory BookmarkBaseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkBaseModelToJson(this);
}
