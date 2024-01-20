import 'package:marketc/core/utils/app_constants.dart';

import '../../domain/entities/lawyer_register_entity.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'email': email,
      'phone': phone,
      'password': pass,
      'password_confirmation': confirmPass,
    };
  }
}