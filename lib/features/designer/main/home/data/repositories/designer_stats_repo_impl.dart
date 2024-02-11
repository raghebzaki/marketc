import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/resources/api/data_sources.dart';
import '../../../../../../core/resources/api/error_handler.dart';
import '../../../../../../core/resources/api/failure_class.dart';
import '../../domain/entities/designer_stats_entity.dart';
import '../../domain/repositories/designer_stats_repo.dart';
import '../data_sources/designer_stats_service.dart';

class DesignerStatsRepoImpl implements DesignerStatsRepo {
  final DesignerStatService statService;

  DesignerStatsRepoImpl({required this.statService});

  @override
  Future<Either<Failure, DesignerStatsEntity>> getDesignerStats(
      DesignerStatsEntity designerStatsEntity) async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final getStats = await statService.getStats(designerStatsEntity);
        return right(getStats);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
