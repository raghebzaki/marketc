
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entity/subscription_entity.dart';
import '../repositories/subscriptions_repo.dart';

class SubscriptionsUseCase {
  final SubscriptionsRepo subscriptionsRepo;

  SubscriptionsUseCase({required this.subscriptionsRepo});

  Future<Either<Failure, List<PackageDataEntity>>> call(SubscriptionsEntity subscriptionEntity) async {
    return await subscriptionsRepo.getPackages(subscriptionEntity);
  }

}