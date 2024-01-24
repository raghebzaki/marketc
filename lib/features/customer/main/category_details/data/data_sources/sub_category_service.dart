import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../models/sub_category_model.dart';

abstract class SubCategoryService {
  Future<List<SubCategoryModel>> getAllSubCategory();
}

class SubCategoryServiceImpl implements SubCategoryService {

  @override
  Future<List<SubCategoryModel>> getAllSubCategory() async {

    Dio dio = await DioFactory.getDio();
    List<SubCategoryModel> subCategoryList = [];

    final contracts = await dio.get(
      AppConstants.apiBaseUrl + AppConstants.subCategoryUri,
    );

    if (contracts.statusCode == 200) {
      Iterable l = contracts.data['data'];
      subCategoryList = List<SubCategoryModel>.from(
        l.map(
              (model) => SubCategoryModel.fromJson(model),
        ),
      );
    }

    return subCategoryList;
  }


}
