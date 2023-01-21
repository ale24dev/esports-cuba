// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamBaseModel _$TeamBaseModelFromJson(Map<String, dynamic> json) =>
    TeamBaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      ceo: json['ceo'] as String?,
      createdAt: Utils.parseDate(json['created_at']),
      imageLogo: json['image_logo'] as String,
      imageHeader: json['image_header'] as String,
    );

Map<String, dynamic> _$TeamBaseModelToJson(TeamBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'ceo': instance.ceo,
      'image_header': instance.imageHeader,
      'image_logo': instance.imageLogo,
      'created_at': instance.createdAt.toIso8601String(),
    };
