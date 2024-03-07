import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/user_balance_entity.dart';

abstract class UserBalanceRepo {

  Future<Either<Failure, List<UserBalanceEntity>>> getUserBalance(UserBalanceEntity userBalanceEntity);
  Future<Either<Failure, UserBalanceEntity>> withdrawUserBalance(UserBalanceEntity userBalanceEntity);
}