import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/category_details_entity.dart';
import '../../domain/repositories/category_details_repo.dart';
import '../data_sources/category_details_serivce.dart';

class CategoryDetailsRepoImpl implements CategoryDetailsRepo {
  final CategoryProductsService categoryProductsService;

  CategoryDetailsRepoImpl({required this.categoryProductsService});
  @override
  Future<Either<Failure, CategoryDetailsEntity>> getCategoryProducts(CategoryDetailsEntity categoryDetailsEntity) async {
    final result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getProducts = await categoryProductsService.getCategoryProducts(categoryDetailsEntity);
        return right(getProducts);
      } on DioException catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}