import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/add_favorite_model.dart';

abstract class AddFavoriteService {
  Future<AddFavoriteModel> addFavoriteProduct(num? userId, num? productId);
  Future<AddFavoriteModel> checkIfFavoriteProduct(num? userId, num? productId);
}

class AddFavoriteServiceImpl implements AddFavoriteService {
  @override
  Future<AddFavoriteModel> addFavoriteProduct(
      num? userId, num? productId) async {
    Dio dio = await DioFactory.getDio();
    AddFavoriteModel addFavoriteModel = const AddFavoriteModel();

    final addFavorite = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.addFavoriteProductsUri,
      data: {
        "user_id": userId,
        "product_id": productId,
      },
    );

    if (addFavorite.statusCode == 200) {
      addFavoriteModel = AddFavoriteModel.fromJson(addFavorite.data);
    }

    return addFavoriteModel;
  }

  @override
  Future<AddFavoriteModel> checkIfFavoriteProduct(num? userId, num? productId) async {
    Dio dio = await DioFactory.getDio();
    AddFavoriteModel addFavoriteModel = const AddFavoriteModel();

    final addFavorite = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.checkIfFavoriteProductsUri,
      data: {
        "user_id": userId,
        "product_id": productId,
      },
    );

    if (addFavorite.statusCode == 200) {
      addFavoriteModel = AddFavoriteModel.fromJson(addFavorite.data);
    }

    return addFavoriteModel;
  }
}
