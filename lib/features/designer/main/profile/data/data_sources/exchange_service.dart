import 'package:dio/dio.dart';
import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/exchange_entity.dart';
import '../models/exchange_model.dart';

abstract class ExchangeService {
  Future<ExchangeModel> getExchange(ExchangeEntity exchangeEntity);
}

class ExchangeServiceImpl implements ExchangeService {

  @override
  Future<ExchangeModel> getExchange(ExchangeEntity exchangeEntity) async {

    Dio dio = await DioFactory.getDio();
    ExchangeModel exchangeModel = const ExchangeModel();

    final contracts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerExchange,
      data: ExchangeModel.toJson(exchangeEntity),
    );

    if (contracts.statusCode == 200) {
      exchangeModel=ExchangeModel.fromJson(contracts.data);
    }

    return exchangeModel;
  }

}
