import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../models/lawyer_register_model.dart';

abstract class LawyerRegisterService {
  Future<RegisterModel> userRegister(
    String userName,
    String email,
    String phone,
    String pass,
    String confirmPass,
  );
}

class LawyerRegisterServiceImpl implements LawyerRegisterService {
  @override
  Future<RegisterModel> userRegister(
    String userName,
    String email,
    String phone,
    String pass,
    String confirmPass,
  ) async {
    Dio dio = await DioFactory.getDio();
    RegisterModel registerModel = const RegisterModel();

    final registerUser = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.lawyerRegisterUri,
      data: RegisterModel.toJson(),
    );

    if (registerUser.statusCode == 200) {
      if (registerUser.data['status'] == 1) {
        registerModel = RegisterModel.fromJson(registerUser.data);
        // await UpdateFcmTokenService.updateUserToken(registerModel.id!);
        return registerModel;
      }
    }
    return registerModel;
  }
}
