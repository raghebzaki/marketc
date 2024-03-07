
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entity/buy_subscription_entity.dart';

abstract class BuySubscriptionRepo {
  Future<Either<Failure, BuySubscriptionEntity>> subscribeToPackage(BuySubscriptionEntity buySubscriptionEntity);
}