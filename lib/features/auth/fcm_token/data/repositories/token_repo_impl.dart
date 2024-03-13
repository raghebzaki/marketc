import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketc/features/auth/fcm_token/data/data_sources/token_service.dart';

import '../../../../../core/resources/api/data_sources.dart';
import '../../../../../core/resources/api/error_handler.dart';
import '../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/token_entity.dart';
import '../../domain/repositories/token_repo.dart';

class TokenRepoImpl implements TokenRepo {
  final TokenService tokenService;

  TokenRepoImpl({required this.tokenService});
  @override
  Future<Either<Failure, TokenEntity>> sendToken(TokenEntity tokenEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final token = await tokenService.sendToken(tokenEntity);
        return right(token);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

}