import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../../../../../core/shared/entities/product_entity.dart';
import '../../domain/entities/search_entity.dart';
import '../../domain/repositories/search_repo.dart';
import '../data_sources/search_service.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchService searchService;

  SearchRepoImpl({required this.searchService});
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(SearchEntity searchEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getProducts = await searchService.searchProducts(searchEntity);
        return right(getProducts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}