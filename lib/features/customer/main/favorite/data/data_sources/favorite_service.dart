import 'package:dio/dio.dart';
import 'package:marketc/features/customer/main/favorite/data/models/favorite_model.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';

abstract class FavoriteService {
  Future<List<FavoriteModel>> getAllProducts(num? userId,int? nextPage);
}

class FavoriteServiceImpl implements FavoriteService {

  @override
  Future<List<FavoriteModel>> getAllProducts(num? userId,int? nextPage) async {

    Dio dio = await DioFactory.getDio();
    List<FavoriteModel> productsList = [];

    final contracts = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.favoriteProductsUri,
      data: {
        "user_id":userId,
        "page": nextPage,
      },
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data']['data'];
      productsList = List<FavoriteModel>.from(
        l.map(
              (model) => FavoriteModel.fromJson(model),
        ),
      );
    }

    return productsList;
  }

}
