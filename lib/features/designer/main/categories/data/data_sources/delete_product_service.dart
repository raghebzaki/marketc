import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/delete_product_entity.dart';
import '../models/delete_products_model.dart';

abstract class DeleteProductService {
  Future<DeleteProductModel> delete(DeleteProductEntity deleteProductEntity);
}

class DeleteProductServiceImpl implements DeleteProductService {
  @override
  Future<DeleteProductModel> delete(
      DeleteProductEntity deleteProductEntity) async {
    Dio dio = await DioFactory.getDio();
    DeleteProductModel deleteProductModel = const DeleteProductModel();

    final orders = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.designerDeleteProductUri,
      data: DeleteProductModel.toJson(deleteProductEntity),
    );

    if (orders.statusCode == 200) {
      deleteProductModel = DeleteProductModel.fromJson(orders.data);
    }

    return deleteProductModel;
  }
}
