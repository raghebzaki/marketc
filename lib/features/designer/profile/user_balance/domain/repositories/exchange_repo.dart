import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/exchange_entity.dart';


abstract class ExchangeRepo {
  Future<Either<Failure,ExchangeEntity>> getExchange(ExchangeEntity exchangeEntity);

}
