import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../repositories/verify_account_repo.dart';

class ResendCodeUseCase {
  final VerifyAccountRepo verifyAccountRepo;

  ResendCodeUseCase(this.verifyAccountRepo);

  Future<Either<Failure, dynamic>> call(String email) async {
    return await verifyAccountRepo.resendCode(email);
  }
}