import 'package:joli_crm/features/auth/data/models/user_model.dart';
import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel {
  @JsonKey(name: "msg")
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserModel data;

  LoginResModel(this.message, this.accessToken, this.refreshToken, this.data);

  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResModelToJson(this);

  LoginResEntity toEntity() => LoginResEntity(
    message: message,
    accessToken: accessToken,
    refreshToken: refreshToken,
    data: data.toEntity(),
  );
}
