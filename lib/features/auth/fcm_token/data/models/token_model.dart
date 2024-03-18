import 'package:marketc/features/auth/fcm_token/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    super.userId,
    super.token,
    super.status,
    super.msg,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      status: json['status'] as num,
      msg: json['message'] as String,
    );
  }

  static Map<String, dynamic> toJson(TokenEntity tokenEntity) {
    return {
      'user_id': tokenEntity.userId,
      'fcm_device_token': tokenEntity.token,
    };
  }
}
