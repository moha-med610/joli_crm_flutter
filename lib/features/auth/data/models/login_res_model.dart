import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel extends LoginResEntity {
  LoginResModel({
    @JsonKey(name: "msg") required super.message,
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResModelToJson(this);
}
