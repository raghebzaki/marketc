import 'package:dio/dio.dart';
import 'package:marketc/core/shared/models/product_model.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';

abstract class MostPopularService {
  Future<List<ProductModel>> getAllProducts(int? nextPage);
}

class MostPopularServiceImpl implements MostPopularService {

  @override
  Future<List<ProductModel>> getAllProducts(int? nextPage) async {

    Dio dio = await DioFactory.getDio();
    List<ProductModel> productsList = [];

    final contracts = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.mostPopularProductsUri,
      queryParameters: {
        "page": nextPage,
      },
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data']['data'];
      productsList = List<ProductModel>.from(
        l.map(
              (model) => ProductModel.fromJson(model),
        ),
      );
    }

    return productsList;
  }

}
