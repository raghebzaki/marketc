import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/size_model.dart';

abstract class SizeService {
  Future<List<ProductSizesModel>> getSizes();
}

class SizeServiceImpl implements SizeService {
  @override
  Future<List<ProductSizesModel>> getSizes() async {
    Dio dio = await DioFactory.getDio();
    List<ProductSizesModel> productsModelList = [];

    final colors = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.getColors,
    );

    if (colors.statusCode == 200) {
      Iterable l = colors.data['data']['data'];
      productsModelList = List<ProductSizesModel>.from(
        l.map(
              (model) => ProductSizesModel.fromJson(model),
        ),
      );
    }

    return productsModelList;
  }
}
