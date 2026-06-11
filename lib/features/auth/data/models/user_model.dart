import 'package:joli_crm/core/enum/role_enum.dart';
import 'package:joli_crm/features/auth/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResModel {
  final UserModel user;
  final CompanyModel? company;

  UserResModel(this.user, this.company);

  factory UserResModel.fromJson(Map<String, dynamic> json) =>
      _$UserResModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResModelToJson(this);

  UserResEntity toEntity() =>
      UserResEntity(user.toEntity(), company?.toEntity());
}

@JsonSerializable()
class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final RoleEnum role;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel(
    @JsonKey(name: "_id") this.id,
    this.fullName,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() =>
      UserEntity(id, fullName, email, phone, role, createdAt, updatedAt);
}

@JsonSerializable()
class CompanyModel {
  final String id;
  final String userId;
  final String companyName;
  final String address;
  final String city;
  final DateTime createdAt;
  final DateTime updatedAt;

  CompanyModel(
    @JsonKey(name: "_id") this.id,
    @JsonKey(name: "user") this.userId,
    this.companyName,
    this.address,
    this.city,
    this.createdAt,
    this.updatedAt,
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  Company toEntity() =>
      Company(id, userId, companyName, address, city, createdAt, updatedAt);
}
