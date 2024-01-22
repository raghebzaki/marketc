import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/balance_entity.dart';
import '../../domain/repositories/balance_repo.dart';
import '../data_sources/balance_service.dart';


class BalanceRepoImpl implements BalanceRepo {
  final BalanceService balanceService;

  BalanceRepoImpl(this.balanceService);


  @override
  Future<Either<Failure, BalanceEntity>> getBalance(BalanceEntity balanceEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getBalance = await balanceService.getBalance(balanceEntity);
        return right(getBalance);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}