import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/exchange_entity.dart';
import '../repositories/exchange_repo.dart';


class ExchangeUseCase {
  final ExchangeRepo exchangeRepo;

  ExchangeUseCase(this.exchangeRepo);

  Future<Either<Failure,ExchangeEntity>> call(ExchangeEntity exchangeEntity) async {
    return await exchangeRepo.getExchange(exchangeEntity);
  }
}
