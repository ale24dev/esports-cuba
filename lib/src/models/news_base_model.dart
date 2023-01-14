import 'package:esports_cuba/src/shared/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esports_cuba/src/models/user_base_model.dart';
import 'package:esports_cuba/src/models/base_model.dart';

part 'news_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsBaseModel extends BaseModel {
  ///Identificador
  int id;

  ///Título del anuncio
  String title;

  ///Texto del anuncio
  String text;

  ///Usuario que realiza el anuncio
  @JsonKey(name: "User")
  UserBaseModel user;

  ///Usuario que realiza el anuncio
  List<String> attachments;

  //Fecha de creación del anuncio
  @JsonKey(name: "created_at", fromJson: Utils.parseDate)
  DateTime createdAt;

  NewsBaseModel(
      {required this.id,
      required this.title,
      required this.text,
      required this.user,
      required this.createdAt,
      required this.attachments});

  factory NewsBaseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsBaseModelToJson(this);
}
