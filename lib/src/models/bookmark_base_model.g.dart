// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkBaseModel _$BookmarkBaseModelFromJson(Map<String, dynamic> json) =>
    BookmarkBaseModel(
      id: json['id'] as int,
      userBaseModel:
          UserBaseModel.fromJson(json['xuser'] as Map<String, dynamic>),
      newsBaseModel:
          NewsBaseModel.fromJson(json['news'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkBaseModelToJson(BookmarkBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'xuser': instance.userBaseModel.toJson(),
      'News': instance.newsBaseModel.toJson(),
    };
