import 'package:dio/dio.dart';
import 'package:marketc/features/customer/payment/payment_gate_way/domain/entities/promo_code_entity.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/promo_code_model.dart';

abstract class PromoCodeService {
  Future<PromoCodeModel> addPromoCode(PromoCodeEntity promoCodeEntity);
}

class PromoCodeServiceImpl implements PromoCodeService {

  @override
  Future<PromoCodeModel> addPromoCode(PromoCodeEntity promoCodeEntity) async {

    Dio dio = await DioFactory.getDio();
    PromoCodeModel promoCodeModelModel = const PromoCodeModel();

    final addPromo = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.addPromoCodeUri,
      data: PromoCodeModel.toJson(promoCodeEntity),
    );
    if (addPromo.statusCode == 200) {
      promoCodeModelModel=PromoCodeModel.fromJson(addPromo.data);
    }

    return promoCodeModelModel;
  }

}
