import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketc/features/customer/payment/payment_gate_way/domain/entities/promo_code_entity.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/repositories/promo_code_repo.dart';
import '../data_sources/promo_code_service.dart';


class PromoCodeRepoImpl implements PromoCodeRepo {
  final PromoCodeService promoCodeService;

  PromoCodeRepoImpl(this.promoCodeService);


  @override
  Future<Either<Failure, PromoCodeEntity>> addPromoCode(PromoCodeEntity promoCodeEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final addPromoCode = await promoCodeService.addPromoCode(promoCodeEntity);
        return right(addPromoCode);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}