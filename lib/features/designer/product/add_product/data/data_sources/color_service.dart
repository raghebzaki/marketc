import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/color_model.dart';

abstract class ColorService {
  Future<List<ProductColorsModel>> getColors();
}

class ColorServiceImpl implements ColorService {
  @override
  Future<List<ProductColorsModel>> getColors() async {
    Dio dio = await DioFactory.getDio();
    List<ProductColorsModel> productsModelList = [];

    final colors = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.getColors,
    );

    if (colors.statusCode == 200) {
      Iterable l = colors.data['data']['data'];
      productsModelList = List<ProductColorsModel>.from(
        l.map(
          (model) => ProductColorsModel.fromJson(model),
        ),
      );
    }

    return productsModelList;
  }
}
