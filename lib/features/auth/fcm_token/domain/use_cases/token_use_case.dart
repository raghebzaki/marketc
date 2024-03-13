import 'package:dartz/dartz.dart';

import '../../../../../core/resources/api/failure_class.dart';
import '../entities/token_entity.dart';
import '../repositories/token_repo.dart';

class TokenUseCase {
  final TokenRepo tokenRepo;

  TokenUseCase({required this.tokenRepo});

  Future<Either<Failure, TokenEntity>> call(TokenEntity tokenEntity) async {
    return await tokenRepo.sendToken(tokenEntity);
  }
}