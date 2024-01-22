import 'package:dartz/dartz.dart';
import 'package:marketc/features/customer/payment/payment_gate_way/domain/entities/promo_code_entity.dart';

import '../../../../../../core/resources/api/failure_class.dart';
import '../repositories/promo_code_repo.dart';


class PromoCodeUseCase {
  final PromoCodeRepo promoCodeRepo;

  PromoCodeUseCase(this.promoCodeRepo);

  Future<Either<Failure,PromoCodeEntity>> call(PromoCodeEntity promoCodeEntity) async {
    return await promoCodeRepo.addPromoCode(promoCodeEntity);
  }
}
