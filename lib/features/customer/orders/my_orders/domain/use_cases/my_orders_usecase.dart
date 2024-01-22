import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/my_orders_entity.dart';
import '../repositories/my_orders_repo.dart';

class MyOrdersUseCase {
  final MyOrdersRepo myOrdersRepo;

  MyOrdersUseCase({required this.myOrdersRepo});

  Future<Either<Failure, MyOrdersEntity>> call(
      MyOrdersEntity myOrdersEntity) async {
    return await myOrdersRepo.myOrders(myOrdersEntity);
  }
}
