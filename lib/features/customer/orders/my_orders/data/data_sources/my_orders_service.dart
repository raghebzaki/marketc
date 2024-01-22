import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/my_orders_entity.dart';
import '../models/my_orders_model.dart';

abstract class MyOrdersService {
  Future<MyOrdersModel> getOrders(MyOrdersEntity myOrdersEntity);
}

class MyOrdersServiceImpl implements MyOrdersService {
  @override
  Future<MyOrdersModel> getOrders(MyOrdersEntity myOrdersEntity) async {
    Dio dio = await DioFactory.getDio();
    MyOrdersModel myOrdersModel = const MyOrdersModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.getMyOrdersUri,
      data: MyOrdersModel.toJson(myOrdersEntity),
    );

    if (orders.statusCode == 200) {
      myOrdersModel = MyOrdersModel.fromJson(orders.data);
    }

    return myOrdersModel;
  }
}
