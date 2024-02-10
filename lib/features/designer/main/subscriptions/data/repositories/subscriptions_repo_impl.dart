import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';



import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entity/subscription_entity.dart';
import '../../domain/repositories/subscriptions_repo.dart';
import '../data_sources/subscriptions_service.dart';

class SubscriptionsRepoImpl implements SubscriptionsRepo {
  final SubscriptionService subscriptionService;

  SubscriptionsRepoImpl({required this.subscriptionService});
  @override
  Future<Either<Failure, List<PackageDataEntity>>> getPackages(SubscriptionsEntity subscriptionEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final subs = await subscriptionService.getPackages(subscriptionEntity);
        return right(subs);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}