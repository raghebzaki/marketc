import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketc/core/shared/entity/product_entity.dart';
import 'package:marketc/features/customer/main/home/data/data_sources/most_popular_service.dart';
import 'package:marketc/features/customer/main/home/domain/repositories/most_popular_repo.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';


class MostPopularRepoImpl implements MostPopularRepo {
  final MostPopularService mostPopularService;

  MostPopularRepoImpl(this.mostPopularService);


  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts( int? nextPage) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getContracts = await mostPopularService.getAllProducts( nextPage);
        return right(getContracts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}