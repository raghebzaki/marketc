import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/my_orders_entity.dart';
import '../models/my_orders_model.dart';

abstract class MyOrdersService {
  Future<List<MyOrdersModel>> getOrders(MyOrdersEntity myOrdersEntity);
}

class MyOrdersServiceImpl implements MyOrdersService {
  @override
  Future<List<MyOrdersModel>> getOrders(MyOrdersEntity myOrdersEntity) async {
    Dio dio = await DioFactory.getDio();
    List<MyOrdersModel> ordersList = [];

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.getMyOrdersUri,
      queryParameters: MyOrdersModel.queryToJson(myOrdersEntity),
      data: MyOrdersModel.dataToJson(myOrdersEntity),
    );

    if (orders.statusCode == 200) {
      Iterable l = orders.data;
      ordersList = List<MyOrdersModel>.from(
        l.map(
              (model) => MyOrdersModel.fromJson(model),
        ),
      );
    }

    return ordersList;
  }
}
