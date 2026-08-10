import 'package:json_annotation/json_annotation.dart';

part 'change_password_req_model.g.dart';

@JsonSerializable()
class ChangePasswordReqModel {
  @JsonKey(name: "currentPassword")
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  ChangePasswordReqModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordReqModelToJson(this);
}
