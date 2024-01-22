import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/balance_entity.dart';


abstract class BalanceRepo {
  Future<Either<Failure,BalanceEntity>> getBalance(BalanceEntity balanceEntity);

}
