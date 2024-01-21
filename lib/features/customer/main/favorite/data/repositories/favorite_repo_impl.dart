import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketc/features/customer/main/favorite/data/data_sources/favorite_service.dart';
import 'package:marketc/features/customer/main/favorite/domain/entities/favorite_entity.dart';
import 'package:marketc/features/customer/main/favorite/domain/repositories/favorite_repo.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';


class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteService favoriteService;

  FavoriteRepoImpl(this.favoriteService);


  @override
  Future<Either<Failure, List<FavoriteEntity>>> getAllProducts(num? userId, int? nextPage) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getContracts = await favoriteService.getAllProducts(userId, nextPage);
        return right(getContracts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}