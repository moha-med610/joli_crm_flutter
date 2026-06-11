import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum RoleEnum {
  @JsonValue(0)
  ADMIN,
  @JsonValue(1)
  COMPANY,
}
