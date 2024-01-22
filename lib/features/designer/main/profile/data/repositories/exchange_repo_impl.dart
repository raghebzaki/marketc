import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/exchange_entity.dart';
import '../../domain/repositories/exchange_repo.dart';
import '../data_sources/exchange_service.dart';


class ExchangeRepoImpl implements ExchangeRepo {
  final ExchangeService exchangeService;

  ExchangeRepoImpl(this.exchangeService);


  @override
  Future<Either<Failure, ExchangeEntity>> getExchange(ExchangeEntity exchangeEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getExchange = await exchangeService.getExchange(exchangeEntity);
        return right(getExchange);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}