
import 'package:dartz/dartz.dart';
import 'package:marketc/core/shared/entities/order_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';

abstract class MyOrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> myOrders(OrderEntity myOrdersEntity);
}