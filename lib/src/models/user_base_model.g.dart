// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseModel _$UserBaseModelFromJson(Map<String, dynamic> json) =>
    UserBaseModel(
      id: json['id'] as int,
      image: json['image'] as String,
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      createdAt: Utils.parseDate(json['created_at']),
    );

Map<String, dynamic> _$UserBaseModelToJson(UserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'image': instance.image,
      'password': instance.password,
      'phone': instance.phone,
      'created_at': instance.createdAt.toIso8601String(),
    };
