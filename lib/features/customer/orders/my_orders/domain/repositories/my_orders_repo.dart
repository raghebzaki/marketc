
import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/my_orders_entity.dart';

abstract class MyOrdersRepo {
  Future<Either<Failure, MyOrdersEntity>> myOrders(MyOrdersEntity myOrdersEntity);
}