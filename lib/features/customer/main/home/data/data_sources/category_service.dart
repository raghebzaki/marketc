import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/category_model.dart';

abstract class CategoryService {
  Future<List<CategoryModel>> getAllCategory();
}

class CategoryServiceImpl implements CategoryService {

  @override
  Future<List<CategoryModel>> getAllCategory() async {

    Dio dio = await DioFactory.getDio();
    List<CategoryModel> categoryList = [];

    final contracts = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.categoryUri,
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data'];
      categoryList = List<CategoryModel>.from(
        l.map(
              (model) => CategoryModel.fromJson(model),
        ),
      );
    }

    return categoryList;
  }


}
