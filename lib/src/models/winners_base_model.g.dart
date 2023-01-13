// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winners_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinnersBaseModel _$WinnersBaseModelFromJson(Map<String, dynamic> json) =>
    WinnersBaseModel(
      id: json['id'] as int,
      firstPlace: json['first_place'] as String,
      secondPlace: json['second_place'] as String,
      thirdPlace: json['third_place'] as String,
    );

Map<String, dynamic> _$WinnersBaseModelToJson(WinnersBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_place': instance.firstPlace,
      'second_place': instance.secondPlace,
      'third_place': instance.thirdPlace,
    };
