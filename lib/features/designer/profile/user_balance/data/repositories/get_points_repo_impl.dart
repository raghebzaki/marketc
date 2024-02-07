import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/get_points_entity.dart';
import '../../domain/repositories/get_points_repo.dart';
import '../data_sources/get_points_service.dart';


class GetPointsRepoImpl implements GetPointsRepo {
  final GetPointsService getPointsService;

  GetPointsRepoImpl(this.getPointsService);


  @override
  Future<Either<Failure, List<GetPointsEntity>>> getAllPoints(num? userId) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getGetPoints = await getPointsService.getAllPoints(userId);
        return right(getGetPoints);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}