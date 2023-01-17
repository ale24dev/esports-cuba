// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionBaseModel _$VersionBaseModelFromJson(Map<String, dynamic> json) =>
    VersionBaseModel(
      id: json['id'] as int,
      version: json['version'] as String,
      status: json['status'] as String,
      breakingChange: json['breaking_change'] as bool,
      createdAt: Utils.parseDate(json['created_at']),
    );

Map<String, dynamic> _$VersionBaseModelToJson(VersionBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'status': instance.status,
      'breaking_change': instance.breakingChange,
      'created_at': instance.createdAt.toIso8601String(),
    };
