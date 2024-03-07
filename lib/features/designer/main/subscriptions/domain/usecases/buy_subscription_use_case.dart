import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entity/buy_subscription_entity.dart';
import '../repositories/buy_subscription_reop.dart';

class BuySubscriptionUseCase {
  final BuySubscriptionRepo buySubscriptionRepo;

  BuySubscriptionUseCase({required this.buySubscriptionRepo});

  Future<Either<Failure, BuySubscriptionEntity>> call(
      BuySubscriptionEntity buySubscriptionEntity) async {
    return await buySubscriptionRepo.subscribeToPackage(buySubscriptionEntity);
  }
}
