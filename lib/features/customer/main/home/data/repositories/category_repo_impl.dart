import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repo.dart';
import '../data_sources/category_service.dart';


class CategoryRepoImpl implements CategoryRepo {
  final CategoryService categoryService;

  CategoryRepoImpl(this.categoryService);


  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategory() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getCategory = await categoryService.getAllCategory();
        return right(getCategory);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}