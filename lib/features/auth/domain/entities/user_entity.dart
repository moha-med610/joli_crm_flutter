import 'package:joli_crm/core/enum/role_enum.dart';

class UserResEntity {
  final UserEntity user;
  final Company? company;

  UserResEntity(this.user, this.company);
}

class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final RoleEnum role;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserEntity(
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  );
}

class Company {
  final String id;
  final String userId;
  final String companyName;
  final String address;
  final String city;
  final DateTime createdAt;
  final DateTime updatedAt;

  Company(
    this.id,
    this.userId,
    this.companyName,
    this.address,
    this.city,
    this.createdAt,
    this.updatedAt,
  );
}
