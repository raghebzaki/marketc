import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/lawyer_register_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterEntity>> userRegister(String userName, String email, String phone, String pass, String confirmPass);
  Future<Either<Failure, String?>> checkRegisterEmail(String email);
}