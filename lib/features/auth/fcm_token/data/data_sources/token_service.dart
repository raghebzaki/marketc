import 'package:dio/dio.dart';

import '../../../../../core/service/dio_factory.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/token_entity.dart';
import '../models/token_model.dart';

abstract class TokenService {
  Future<TokenModel> sendToken(TokenEntity tokenEntity);
}

class TokenServiceImpl implements TokenService {
  @override
  Future<TokenModel> sendToken(TokenEntity tokenEntity) async {
    Dio dio = await DioFactory.getDio();
    TokenModel tokenModel = const TokenModel();

    final deviceToken = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.fcmTokenUri,
      data: TokenModel.toJson(tokenEntity),

    );

    if (deviceToken.statusCode == 200) {
      tokenModel = TokenModel.fromJson(deviceToken.data);
    }

    return tokenModel;
  }

}