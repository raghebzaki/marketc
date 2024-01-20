import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/lawyer_register_entity.dart';
import '../repositories/lawyer_register_repo.dart';

class LawyerRegisterUseCase {
  final RegisterRepo registerRepo;

  LawyerRegisterUseCase({required this.registerRepo});

  Future<Either<Failure, RegisterEntity>> call(String userName, String email,
      String phone, String pass, String confirmPass) async {
    return await registerRepo.userRegister(
        userName, email, phone, pass, confirmPass);
  }
}
