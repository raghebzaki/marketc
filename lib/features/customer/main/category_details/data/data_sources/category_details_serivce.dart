import 'package:dio/dio.dart';

import '../../../../../../core/service/dio_factory.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/category_details_entity.dart';
import '../models/category_details_model.dart';

abstract class CategoryProductsService {
  Future<CategoryDetailsModel> getCategoryProducts(CategoryDetailsEntity categoryDetailsEntity);
}

class CategoryProductsServiceImpl implements CategoryProductsService {
  @override
  Future<CategoryDetailsModel> getCategoryProducts(CategoryDetailsEntity categoryDetailsEntity) async {
    Dio dio = await DioFactory.getDio();
    CategoryDetailsModel categoryDetailsModel = const CategoryDetailsModel();

    final getProducts = await dio.post(
      AppConstants.apiBaseUrl + AppConstants.categoryDetailsUri,
      data: CategoryDetailsModel.toJson(categoryDetailsEntity),
    );

    if (getProducts.statusCode == 200) {
      categoryDetailsModel = CategoryDetailsModel.fromJson(getProducts.data);
    }

    return categoryDetailsModel;
  }
}
