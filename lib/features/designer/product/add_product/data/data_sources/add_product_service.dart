import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/add_product_entity.dart';
import '../models/add_product_model.dart';


abstract class AddProductService {
  Future<AddProductModel> add(AddProductEntity addProductEntity);
}

class AddProductServiceImpl implements AddProductService {
  @override
  Future<AddProductModel> add(
      AddProductEntity addProductEntity) async {
    Dio dio = await DioFactory.getDio();
    AddProductModel addProductModel = const AddProductModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerAddProduct,
      data: AddProductModel.toJson(addProductEntity),
    );

    if (orders.statusCode == 200) {
      addProductModel = AddProductModel.fromJson(orders.data);
    }

    return addProductModel;
  }
}
