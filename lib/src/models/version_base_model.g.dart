// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionBaseModel _$VersionBaseModelFromJson(Map<String, dynamic> json) =>
    VersionBaseModel(
      id: json['id'] as int,
      version: json['version'] as String,
      versionApp: json['version_app'] as String?,
      status: json['status'] as String,
      breakingChange: json['breaking_change'] as bool,
      createdAt: Utils.parseDate(json['created_at']),
      url: json['url'] as String,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VersionBaseModelToJson(VersionBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'version_app': instance.versionApp,
      'status': instance.status,
      'url': instance.url,
      'features': instance.features,
      'breaking_change': instance.breakingChange,
      'created_at': instance.createdAt.toIso8601String(),
    };
