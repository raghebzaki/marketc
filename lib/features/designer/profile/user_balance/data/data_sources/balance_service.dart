import 'package:dio/dio.dart';
import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/balance_entity.dart';
import '../models/balance_model.dart';

abstract class BalanceService {
  Future<BalanceModel> getBalance(BalanceEntity balanceEntity);
}

class BalanceServiceImpl implements BalanceService {

  @override
  Future<BalanceModel> getBalance(BalanceEntity balanceEntity) async {

    Dio dio = await DioFactory.getDio();
    BalanceModel balanceModel = const BalanceModel();

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerBalanceUri,
      data: BalanceModel.toJson(balanceEntity),
    );

    if (contracts.statusCode == 200) {
      balanceModel=BalanceModel.fromJson(contracts.data);
    }

    return balanceModel;
  }

}
