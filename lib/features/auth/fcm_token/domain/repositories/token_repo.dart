
import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/token_entity.dart';

abstract class TokenRepo {
  Future<Either<Failure, TokenEntity>> sendToken(TokenEntity tokenEntity);
}