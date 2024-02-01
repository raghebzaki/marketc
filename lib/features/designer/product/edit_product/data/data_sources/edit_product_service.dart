import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/edit_product_entity.dart';
import '../models/edit_product_model.dart';

abstract class EditProductService {
  Future<EditProductModel> edit(EditProductEntity editProductEntity);
}

class EditProductServiceImpl implements EditProductService {
  @override
  Future<EditProductModel> edit(EditProductEntity editProductEntity) async {
    Dio dio = await DioFactory.getDio();
    EditProductModel editProductModel = const EditProductModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.updateProductUri,
      data: EditProductModel.toJson(editProductEntity),
    );

    if (orders.statusCode == 200) {
      editProductModel = EditProductModel.fromJson(orders.data);
    }

    return editProductModel;
  }
}
