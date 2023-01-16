// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseModel _$UserBaseModelFromJson(Map<String, dynamic> json) =>
    UserBaseModel(
      id: json['id'] as int,
      image: json['image'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      birthday: Utils.parseDate(json['birthday']),
      createdAt: Utils.parseDate(json['created_at']),
    );

Map<String, dynamic> _$UserBaseModelToJson(UserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'email': instance.email,
      'birthday': instance.birthday.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
