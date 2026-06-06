import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final String message;
  final String? error;
  final int? statusCode;
  final Map<String, List<String>>? errors;

  ErrorModel({required this.message, this.error, this.statusCode, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  String get firstError {
    if (errors == null || errors!.isEmpty) {
      return message;
    }

    return errors!.values.first.first;
  }

  String get allErrors {
    if (errors == null) return message;

    return errors!.values.expand((e) => e).join('\n');
  }
}
