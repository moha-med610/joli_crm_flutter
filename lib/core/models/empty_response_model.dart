import 'package:json_annotation/json_annotation.dart';

part 'empty_response_model.g.dart';

@JsonSerializable()
class EmptyResponseModel {
  EmptyResponseModel();

  factory EmptyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyResponseModelToJson(this);
}
