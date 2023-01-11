import 'package:esports_cuba/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserBaseModel extends BaseModel{
  int id;

  String nickname;

  String image;

  String password;

  String phone;

  @JsonKey(name: "created_at", fromJson: parseDate)
  DateTime createdAt;

  UserBaseModel({
    required this.id,
    required this.image,
    required this.nickname,
    required this.password,
    required this.phone,
    required this.createdAt,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserBaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserBaseModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserBaseModelToJson(this);

  static int parseId(dynamic idToParse) {
    return idToParse is String ? int.parse(idToParse) : idToParse;
  }

  static DateTime parseDate(dynamic date) {
    return DateTime.parse(date);
  }
}
