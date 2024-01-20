// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponseModel _$BasicResponseModelFromJson(Map<String, dynamic> json) =>
    BasicResponseModel(
      status: json['status'] as num? ?? 2077,
      msg: json['message'] as String? ?? 'UNKNOWN STRING VALUE',
    );

Map<String, dynamic> _$BasicResponseModelToJson(BasicResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.msg,
    };
