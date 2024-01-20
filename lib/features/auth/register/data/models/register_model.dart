import 'package:marketc/core/utils/app_constants.dart';

import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel ({
    super.status,
    super.msg,
    super.userName,
    super.email,
    super.id,
    super.phone,
    super.pass,
    super.confirmPass,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] as num? ?? AppConstants.unknownNumValue,
      msg: json['message'] as String? ?? AppConstants.unknownStringValue,
      id:json['user']['id'],
    );
  }

  static Map<String, dynamic> toJson(RegisterEntity registerEntity) {
    return {
      'name': registerEntity.userName,
      'email': registerEntity.email,
      'password': registerEntity.pass,
      'password_confirmation': registerEntity.confirmPass,
    };
  }
}