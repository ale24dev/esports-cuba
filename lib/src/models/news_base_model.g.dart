// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsBaseModel _$NewsBaseModelFromJson(Map<String, dynamic> json) =>
    NewsBaseModel(
      id: json['id'] as int,
      text: json['text'] as String,
      user: UserBaseModel.fromJson(json['User'] as Map<String, dynamic>),
      createdAt: Utils.parseDate(json['created_at']),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NewsBaseModelToJson(NewsBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'User': instance.user.toJson(),
      'attachments': instance.attachments,
      'created_at': instance.createdAt.toIso8601String(),
    };
