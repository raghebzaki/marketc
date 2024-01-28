import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/add_favorite_entity.dart';
import '../../domain/repositories/add_favorite_model.dart';
import '../data_sources/add_favorite_service.dart';

class AddFavoriteRepoImpl implements AddFavoriteRepo {
  final AddFavoriteService addFavoriteService;

  AddFavoriteRepoImpl({required this.addFavoriteService});

  @override
  Future<Either<Failure, AddFavoriteEntity>> addProductToFavorites(
      num? userId, num? productId) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getContracts =
            await addFavoriteService.addFavoriteProduct(userId, productId);
        return right(getContracts);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
