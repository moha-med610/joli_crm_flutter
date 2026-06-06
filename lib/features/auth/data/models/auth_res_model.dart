import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_res_model.g.dart';

@JsonSerializable()
class AuthResModel extends AuthResEntity {
  AuthResModel(@JsonKey(name: "msg") super.message);

  factory AuthResModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResModelToJson(this);
}
