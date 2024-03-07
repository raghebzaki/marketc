import 'package:dio/dio.dart';
import 'package:marketc/core/service/dio_factory.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entity/buy_subscription_entity.dart';
import '../models/buy_subscription_model.dart';

abstract class BuySubscriptionService {
  Future<BuySubscriptionModel> subscribe(BuySubscriptionEntity buySubscriptionEntity);
}

class BuySubscriptionServiceImpl implements BuySubscriptionService {

  @override
  Future<BuySubscriptionModel> subscribe(BuySubscriptionEntity buySubscriptionEntity) async {
    Dio dio = await DioFactory.getDio();
    BuySubscriptionModel buySubscriptionModel = const BuySubscriptionModel();

    final buyPackages = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.packageSubscriptionUri,
      queryParameters: BuySubscriptionModel.toJson(buySubscriptionEntity),
    );

    if (buyPackages.statusCode == 200) {
      buySubscriptionModel = BuySubscriptionModel.fromJson(buyPackages.data);
    }

    return buySubscriptionModel;
  }
}
