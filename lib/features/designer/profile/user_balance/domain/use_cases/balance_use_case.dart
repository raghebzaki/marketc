import 'package:dartz/dartz.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/balance_entity.dart';
import '../repositories/balance_repo.dart';


class BalanceUseCase {
  final BalanceRepo balanceRepo;

  BalanceUseCase(this.balanceRepo);

  Future<Either<Failure,BalanceEntity>> call(BalanceEntity balanceEntity) async {
    return await balanceRepo.getBalance(balanceEntity);
  }
}
