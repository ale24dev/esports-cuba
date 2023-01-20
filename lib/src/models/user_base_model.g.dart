// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseModel _$UserBaseModelFromJson(Map<String, dynamic> json) =>
    UserBaseModel(
      id: json['id'] as String,
      username: json['username'] as String,
      image: json['image'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserBaseModelToJson(UserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'email': instance.email,
    };
