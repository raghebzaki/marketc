import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketc/core/resources/api/failure_class.dart';
import 'package:marketc/features/designer/main/subscriptions/data/data_sources/buy_subscription_service.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/entity/buy_subscription_entity.dart';
import 'package:marketc/features/designer/main/subscriptions/domain/repositories/buy_subscription_reop.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';

class BuySubscriptionRepoImpl implements BuySubscriptionRepo {
  final BuySubscriptionService buySubscriptionService;

  BuySubscriptionRepoImpl({required this.buySubscriptionService});
  @override
  Future<Either<Failure, BuySubscriptionEntity>> subscribeToPackage(BuySubscriptionEntity buySubscriptionEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final buySubs = await buySubscriptionService.subscribe(buySubscriptionEntity);
        return right(buySubs);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

}