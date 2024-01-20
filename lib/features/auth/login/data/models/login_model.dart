
import '../../../../../core/shared/models/user_data_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    super.status,
    super.msg,
    super.userData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json["status"] as num? ?? AppConstants.unknownNumValue,
      msg: json["message"] as String? ?? AppConstants.unknownStringValue,
      userData: UserData.fromJson(json["userData"]),
    );
  }


}