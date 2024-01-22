import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/my_designer_products_entity.dart';
import '../models/my_designer_products_model.dart';

abstract class MyDesignerProductsService {
  Future<MyDesignerProductsModel> getProducts(
      MyDesignerProductsEntity myDesignerProductsEntity);
}

class MyDesignerProductsServiceImpl implements MyDesignerProductsService {
  @override
  Future<MyDesignerProductsModel> getProducts(
      MyDesignerProductsEntity myDesignerProductsEntity) async {
    Dio dio = await DioFactory.getDio();
    MyDesignerProductsModel myDesignerProductsModel =
        const MyDesignerProductsModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.getMyOrdersUri,
      data: MyDesignerProductsModel.toJson(myDesignerProductsEntity),
    );

    if (orders.statusCode == 200) {
      myDesignerProductsModel = MyDesignerProductsModel.fromJson(orders.data);
    }

    return myDesignerProductsModel;
  }
}
