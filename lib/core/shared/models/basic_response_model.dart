import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/app_constants.dart';

part 'basic_response_model.g.dart';

@JsonSerializable()
class BasicResponseModel extends Equatable {
  @JsonKey(name: "status", defaultValue: AppConstants.unknownNumValue)
  final num? status;
  @JsonKey(name: "message", defaultValue: AppConstants.unknownStringValue)
  final String? msg;

  const BasicResponseModel({
    this.status,
    this.msg,
  });

  factory BasicResponseModel.fromJson(Map<String, dynamic> json) => _$BasicResponseModelFromJson(json);

  @override
  List<Object?> get props => [
        status,
        msg,
      ];
}
