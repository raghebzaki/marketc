import 'package:dartz/dartz.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../entities/promo_code_entity.dart';


abstract class PromoCodeRepo {
  Future<Either<Failure,PromoCodeEntity>> addPromoCode(PromoCodeEntity promoCodeEntity);

}
