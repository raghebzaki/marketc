import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/user_balance_entity.dart';
import '../repositories/user_balance_repo.dart';

class GetUserBalanceUseCase {
  final UserBalanceRepo userBalanceRepo;

  GetUserBalanceUseCase({required this.userBalanceRepo});

  Future<Either<Failure, List<UserBalanceEntity>>> call(
      UserBalanceEntity userBalanceEntity) async {
    return await userBalanceRepo.getUserBalance(userBalanceEntity);
  }
}
