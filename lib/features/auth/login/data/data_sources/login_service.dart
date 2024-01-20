import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../models/login_model.dart';

abstract class LoginService {
  Future<LoginModel> login(String email, String pass);
}

class LoginServiceImpl implements LoginService {
  @override
  Future<LoginModel> login(String email, String pass) async {
    Dio dio = await DioFactory.getDio();
    LoginModel loginModel = const LoginModel();

    final loginUser = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.loginUri,
      data: {
        "email": email,
        "pass": pass,
      },
    );

    if (loginUser.statusCode == 200) {
      loginModel = LoginModel.fromJson(loginUser.data);
    }

    return loginModel;
  }
}
