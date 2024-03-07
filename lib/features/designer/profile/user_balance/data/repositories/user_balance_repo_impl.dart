import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/user_balance_entity.dart';
import '../../domain/repositories/user_balance_repo.dart';
import '../data_sources/user_balance_service.dart';

class UserBalanceRepoImpl implements UserBalanceRepo {
  final UserBalanceService userBalanceService;

  UserBalanceRepoImpl({required this.userBalanceService});

  @override
  Future<Either<Failure, List<UserBalanceEntity>>> getUserBalance(
      UserBalanceEntity userBalanceEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final balance = await userBalanceService.getBalance(userBalanceEntity);
        return right(balance);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserBalanceEntity>> withdrawUserBalance(
      UserBalanceEntity userBalanceEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final withdraw =
            await userBalanceService.withdrawBalance(userBalanceEntity);
        return right(withdraw);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}
