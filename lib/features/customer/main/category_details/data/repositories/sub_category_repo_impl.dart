import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/sub_category_entity.dart';
import '../../domain/repositories/sub_category_repo.dart';
import '../data_sources/sub_category_service.dart';


class SubCategoryRepoImpl implements SubCategoryRepo {
  final SubCategoryService subCategoryService;

  SubCategoryRepoImpl(this.subCategoryService);


  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getAllSubCategory() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getSubCategory = await subCategoryService.getAllSubCategory();
        return right(getSubCategory);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}