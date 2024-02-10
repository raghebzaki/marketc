import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entity/subscription_entity.dart';
import '../models/subscriptions_model.dart';

abstract class SubscriptionService {
  Future<List<PackageDataModel>> getPackages(SubscriptionsEntity subscriptionEntity);
}

class SubscriptionServiceImpl implements SubscriptionService {
  @override
  Future<List<PackageDataModel>> getPackages(SubscriptionsEntity subscriptionEntity) async {
    Dio dio = await DioFactory.getDio();
    List<PackageDataModel> subscriptions = [];

    final packages = await dio.get(
        AppConstants.apiBaseUrl + AppConstants.getPackagesUri,
        queryParameters: SubscriptionsModel.toJson(subscriptionEntity),
    );

    if (packages.statusCode == 200) {
      Iterable l = packages.data['data']['data'];
      subscriptions = List<PackageDataModel>.from(
        l.map(
              (model) => PackageDataModel.fromJson(model),
        ),
      );
    }

    return subscriptions;
  }
}