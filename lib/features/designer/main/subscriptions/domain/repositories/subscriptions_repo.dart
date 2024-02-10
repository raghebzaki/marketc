
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entity/subscription_entity.dart';

abstract class SubscriptionsRepo {
  Future<Either<Failure, List<PackageDataEntity>>> getPackages(SubscriptionsEntity subscriptionEntity);
}